# 🧩 全端專案整合 - Java 後端 + MySQL 資料庫 + HTML 前端

此專案為一個完整的 CRUD 系統示範，整合了 Java 後端、MySQL 資料庫與原生 HTML/CSS/JS 前端。
適合作為學習後端設計與系統整合的作品集展示或教育用途。

---

## 📁 專案目錄結構

```
📦 專案根目錄
├── be/               # Java + Maven 後端專案
├── DB/               # MySQL 資料庫腳本與原始匯出檔案
├── FE/               # HTML + CSS + JS 前端頁面
```

---

## 🖥️ 後端（be/）

- 技術：Java 17 + Maven
- 功能：資料連線、API 提供、資料新增／查詢／異動／刪除
- 啟動方式：

```bash
cd be
mvn clean package
java -jar target/be.jar
```

詳情請見 👉 [`be/README.md`](be/README.md)

---

## 🗄️ 資料庫（DB/）

- 技術：MySQL 8.0+
- 檔案包含：
  - 建立資料表：`0_create_tables.sql`
  - 匯入資料：`1_insert_data.sql`
  - 建立視圖：`2_create_views.sql`
- 初始化方式：

```sql
CREATE DATABASE chick_hicks DEFAULT CHARACTER SET utf8mb4;
USE chick_hicks;

-- 接著在 CLI 或工具匯入
mysql -u root -p chick_hicks < 0_create_tables.sql
mysql -u root -p chick_hicks < 1_insert_data.sql
mysql -u root -p chick_hicks < 2_create_views.sql
```

詳情請見 👉 [`DB/README.md`](DB/README.md)

---

## 🌐 前端（FE/）

- 技術：HTML + CSS + JavaScript（原生）
- 功能頁面：
  - `demoInsert.html`：新增訂單
  - `demoInsert2.html`：新增設備與維護人員
  - `demoAPI.html`：查詢資料表
  - `demoAPI2.html`：異動／刪除資料
  - `sidebar.html`：單頁應用導覽入口（SPA 模擬）

請開啟 `sidebar.html` 進入主畫面。  
請確認後端已啟動於 `http://localhost:8000`。

詳情請見 👉 [`FE/README.md`](FE/README.md)

---

## ✅ 執行順序建議

1. 匯入資料庫（DB 資料夾內 SQL）
2. 啟動後端 JAR（be 資料夾）
3. 開啟前端頁面（FE/sidebar.html）

---

## ✨ 補充說明

- 本專案無使用框架（如 Spring / React），目的為展示基礎資料流程與整合能力。
- 適用於教育用途、課程作業或作品集展示。