# 🖥️ Backend - Java with Maven

本資料夾為後端程式，使用 Java + Maven 開發，負責與 MySQL 資料庫連線並執行資料存取邏輯。此後端與 `/DB` 資料庫及 `/FE` 前端模組相關聯，可作為全端專案的一部分展示。

---

## ⚙️ 技術架構

- Java 17
- Maven 專案管理
- MySQL Connector 8.0.19
- JDBC 資料庫連線

---

## 📁 專案結構

```
be/
├── pom.xml
└── src/
    └── main/
        └── java/
            └── com/
                └── example/
                    ├── Main.java         # 主程式進入點
                    └── DBConnect.java    # 負責與 MySQL 建立連線
```

---

## 🚀 執行方式

### 1️⃣ 編譯與建置

請先確保你已安裝 Maven，然後在 `be/` 目錄下執行：

```bash
mvn clean package
```

成功後會在 `target/` 生成一個可執行 JAR 檔案：

```bash
target/be.jar
```

### 2️⃣ 執行後端程式

```bash
java -jar target/be.jar
```

---

## 🗃️ 資料庫設定

- 資料庫連線邏輯在 `DBConnect.java` 中定義
- 使用 JDBC 方式連接 MySQL 資料庫，請確保已建立好 `/DB` 資料夾中的資料庫並啟動 MySQL

---

## 📝 注意事項

- 若執行時出現連線錯誤，請檢查 `DBConnect.java` 中的主機、帳號與密碼設定是否正確
- 若要整合前端，請確認 API 端點或資料交換格式符合