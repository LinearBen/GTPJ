
    async function updateTable(url, todiv) {
      currentUrl = url;
      currentTodiv = todiv;
      let tablename = '';
      switch (url) {
        case apiUrlProducts:
          tablename = 'products';
          break;
        case apiUrlPurchase:
          tablename = 'purchase';
          break;
        case apiUrlMaintenancerecord:
          tablename = 'maintenancerecord';
          break;
        case apiUrlDeviveRecord:
          tablename = 'devicerecord';
          break;
        case apiUrlVendorRecord:
          tablename = 'vendor';
          break;
      }
      try {
        const resp = await fetch(url);
        if (!resp.ok) throw new Error(`HTTP 錯誤: ${resp.status}`);
        const data = await resp.json();
        // console.log(data);
        if (!Array.isArray(data) || data.length === 0) {
          todiv.textContent = '沒有資料';
          return;
        }
        // 產生表格

        let table = '<table><thead><tr>';
        table += '<th>操作</th>';
        // 自動產出表頭
        const keys = Object.keys(data[0]);
        // console.log(keys);
        keys.forEach(k => {
          if (k != 'state') {
            table += `<th>${k}</th>`;
          }
        });
        table += '</tr></thead><tbody>';
        // 每一列資料
        data.forEach(row => {
          const x = JSON.stringify({ ...row, state: -1, table: tablename });
          // console.log(x);
          table += '<tr>';
          table += `<td><button onclick='updaterow(${x})'>刪除</button></td>`;

          keys.forEach(k => {

            if (k != 'state') {
              table += `<td>${row[k]}</td>`;
              // console.log(row[k]);
            }

          });

          table += '</tr>';
        });
        table += '</tbody></table>';
        todiv.innerHTML = table;
      } catch (err) {
        todiv.textContent = '載入失敗：' + err.message;
      }
    }
    function updaterow(returnbody) {
      console.log(returnbody)
      fetch('http://localhost:8000/api/update', {
        method: 'POST',
        mode: 'cors', // ✅ 很關鍵
        body: JSON.stringify(returnbody),
      })

      updateTable(currentUrl, currentTodiv);
    }
