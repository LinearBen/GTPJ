# 🌐 Frontend - HTML + CSS + JavaScript

本資料夾為前端介面，使用原生 HTML/CSS/JavaScript 製作，透過 `fetch` 呼叫後端 API 與資料庫進行互動。
本前端主要展示以下功能：

- 📝 新增資料（設備／維護人員／訂單等）
- 🔍 查詢資料（產品、訂單、通行紀錄等）
- 🛠 修改／刪除資料（模擬管理功能）
- 📋 響應式側邊導覽列（SPA 模擬）

---

## 📁 專案結構

```
FE/
├── demoAPI.html           # 查詢資料頁面
├── demoAPI2.html          # 編輯／刪除資料頁面
├── demoInsert.html        # 新增訂單頁面
├── demoInsert2.html       # 新增設備／維護人員頁面
├── sidebar.html           # 導覽頁（SPA 模擬）
├── css/
│   ├── demoAPI.css
│   ├── demoInsert.css
│   └── main.css
├── script/
│   ├── loadTable.js
│   └── update.js
```

---

## 🔧 使用方式

1. 將此資料夾放在可被瀏覽器讀取的伺服器（或直接打開 `sidebar.html`）
2. 確保後端 API 正常運作（參考 `/be/README.md`）
3. 開啟 `sidebar.html` 進入系統主畫面，開始操作

---

## 🌐 API 依賴說明

前端會透過下列 URL 進行資料互動，請確認這些路徑由後端正確提供：

- `http://localhost:8000/api/products`
- `http://localhost:8000/api/purchaserecord`
- `http://localhost:8000/api/passagerecord`
- `http://localhost:8000/api/maintenancerecord`
- `http://localhost:8000/api/devicerecord`
- `http://localhost:8000/api/vendorRecord`
- `http://localhost:8000/api/insert`
- `http://localhost:8000/api/update`

---

## 📱 響應式設計

- 側邊欄具備手機版收合功能
- 表單與表格元件皆可在小螢幕顯示

---

## 📝 注意事項

- 請搭配後端伺服器運行，否則會出現 `CORS` 或 API 404 錯誤
- 若要改為實際部署，可整合 Vite、Webpack 或 React 等框架進行優化