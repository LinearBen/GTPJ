
package com.example;

import com.sun.net.httpserver.*;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.nio.charset.StandardCharsets;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Map;
import java.util.stream.Collectors;

public class Main {
    public static void main(String[] args) throws IOException {
        // 建立一個綁定在 localhost:8000 的 server
        HttpServer server = HttpServer.create(new InetSocketAddress(8000), 0);
        // 綁定 API 路由
        server.createContext("/api/purchaserecord", new dataHandler("SELECT * FROM purchaserecord"));
        server.createContext("/api/products", new dataHandler("SELECT * FROM  ticket"));
        server.createContext("/api/passagerecord",  new dataHandler("SELECT * FROM  passagerecord"));
        server.createContext("/api/maintenancerecord",  new dataHandler("SELECT * FROM  maintenancerecord"));
        server.createContext("/api/devicerecord",  new dataHandler("SELECT * FROM  devicerecord"));
        server.createContext("/api/vendorRecord",  new dataHandler("SELECT * FROM  vendorrecord"));
        server.createContext("/api/tickets_total",  new dataHandler("SELECT * FROM  tickets_total"));

        server.createContext("/api/insert" , new InsertDataHandler());
        server.createContext("/api/update" , new UpdateDataHandler());
        // server.createContext("/api/delete" , new DeleteDataHandler());


        // 啟動 server
        server.start();
        System.out.println("Server started at http://localhost:8000");
    }

    static class postdemo implements HttpHandler {
        @Override
        public void handle(HttpExchange exchange) throws IOException {
            String file = "temppost.txt";
            String body = new String(exchange.getRequestBody().readAllBytes(), StandardCharsets.UTF_8);
            try (BufferedWriter bw = new BufferedWriter(new FileWriter(file))) {
                bw.write(body);
            }
            exchange.sendResponseHeaders(200, -1);
        }
    }

    static class getHandler implements HttpHandler {
        @Override
        public void handle(HttpExchange exchange) throws IOException {
            String response = "測試成功";
            exchange.getResponseHeaders().set("Content-Type", "text/plain; charset=utf-8");
            exchange.getResponseHeaders().set("Access-Control-Allow-Origin", "*");
            byte[] responseBytes = response.toString().getBytes("UTF-8");
            exchange.sendResponseHeaders(200, responseBytes.length);
            OutputStream os = exchange.getResponseBody();
            os.write(responseBytes);
            os.close();
        }
    }
     // 檢查車牌是否已持有有效月費
     private static boolean isMonthlyPassActive(String licensePlate) throws SQLException {
        
        ResultSet rs = DBConnect.selectQuery("SELECT * FROM purchase_record WHERE License_Plate = ? AND Ticket_ID = 3 AND Status = 'Active'", licensePlate);
        return rs.next(); // 如果有符合條件的記錄，表示已持有有效月費，回傳 true
    }
    // 更新資料
    static class UpdateDataHandler implements HttpHandler {
        @Override
        public void handle(HttpExchange exchange) throws IOException {
             // ✅ 處理 CORS 預檢請求（OPTIONS）
             if ("OPTIONS".equalsIgnoreCase(exchange.getRequestMethod())) {
                exchange.getResponseHeaders().add("Access-Control-Allow-Origin", "*");
                exchange.getResponseHeaders().add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
                exchange.getResponseHeaders().add("Access-Control-Allow-Headers", "Content-Type");
                exchange.sendResponseHeaders(204, -1); // 204 No Content
                return;
            }
            exchange.getResponseHeaders().add("Access-Control-Allow-Origin", "*");

            String body = new BufferedReader(new InputStreamReader(exchange.getRequestBody(), StandardCharsets.UTF_8))
                    .lines().collect(Collectors.joining());
            Map<String, String> map = DBConnect.parseJson(body);
            // System.out.println(body);
            // System.out.println("");
            // System.out.println(map);
            String targetTable = map.get("table");
            // System.out.println(targetTable);
            // map.forEach((k,v)->{System.out.println(k + "->" + v);});
            switch (targetTable) {
                case "purchase":
                    String LicensePlate = map.get("License_Plate");
                    int id = Integer.parseInt(map.get("Order_ID"));
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    LocalDateTime Purchase_Date = LocalDateTime.parse(map.get("Purchase_Date"), formatter);
                    String purchaseDate = Purchase_Date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

                    System.out.println(purchaseDate);

                    String TicketName = map.get("TicketName");
                    int ticketId = 0;
                    int quantity = Integer.parseInt(map.get("Purchase_Quantity"));
                    String Status = map.get("Status");
                    int state = Integer.parseInt(map.get("state"));
                    ResultSet rs = DBConnect.selectQuery("SELECT * FROM products WHERE TicketName = ?", TicketName);
                    try {
                        if (rs.next()) {
                            ticketId = rs.getInt("TicketID");

                            System.out.println(ticketId);

                            int maxUses = rs.getInt("Max_Uses");
                            int duration = rs.getInt("Duration");
                            String expirationDate = null;

                            // 如果是月費過路權，計算到期日
                            if (ticketId == 3) {
                                LocalDateTime expiration = Purchase_Date.plusDays(duration);
                                expirationDate = expiration.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

                                System.out.println(expirationDate);
                            }

                            int remainingUses = maxUses * quantity;

                            // 到 purchase_record 表 update
                            DBConnect.executeUpdate(
                                    "UPDATE `chick hicks`.`purchase_record` SET `License_Plate` = ?, `Purchase_Date` = ?, `Ticket_ID` = ?, `Expiration_Date` = ?, `Purchase_Quantity` = ? , `Remaining_Uses` = ?, `Status` = ?, `state` = ? WHERE (`Order_ID` = ?);",
                                    LicensePlate, purchaseDate, ticketId, expirationDate, quantity, remainingUses, Status ,state, id);
                        }
                    } catch (SQLException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                    break;
                case "products":
                    int TicketId = Integer.parseInt(map.get("TicketID"));
                    String ticketName = map.get("TicketName");
                    int price = Integer.parseInt(map.get("Price"));
                    int maxUses = Integer.parseInt(map.get("Max_Uses"));
                    int duration = 0;
                    if(map.get("duration") != null){
                        duration = Integer.parseInt(map.get("Duration"));
                    }
                    int pro_state = Integer.parseInt(map.get("state"));
                    DBConnect.executeUpdate(
                            "UPDATE `chick hicks`.`products` SET `TicketName` = ?, `Price` = ?, `Max_Uses` = ?, `Duration` = ?, `state` = ? WHERE (`TicketID` = ?);",
                            ticketName, price, maxUses, duration,pro_state, TicketId);
                    break;
                
                case "devicerecord":
                    try {
                        int Device_ID = Integer.parseInt(map.get("Device_ID"));
                        String Device_Name = map.get("Device_Name");
                        String Purchase_Time = map.get("Purchase_Time");
                        String Purchase_Amount = map.get("Purchase_Amount");
                        int MaintenanceInterval = Integer.parseInt(map.get("Maintenance_Interval"));
                        String Remarks = map.get("Remarks");
                        int dev_state = Integer.parseInt(map.get("state"));
                        DBConnect.executeUpdate(
                                "UPDATE `chick hicks`.`device_record` SET `Device_Name` = ?, `Purchase_Time` = ?, `Purchase_Amount` = ?, `Maintenance_Interval` = ?, `Remarks` = ?, `state` = ? WHERE (`Device_ID` = ?);",
                                Device_Name, Purchase_Time, Purchase_Amount, MaintenanceInterval, Remarks,dev_state, Device_ID);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;
                case "maintenancerecord":
                    try {
                        int maintenanceId = Integer.parseInt(map.get("maintenance_ID"));
                        int Device_ID = Integer.parseInt(map.get("Device_ID"));
                        String Contact_Person = map.get("Contact_Person");
                        String Vendor_Name = map.get("Vendor_Name");
                        int vendorID = 0;
                        String Maintenance_Item = map.get("Maintenance_Item");
                        // DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                        // LocalDateTime Purchase_Date = LocalDateTime.parse(map.get("Purchase_Date"), formatter);
                        // String purchaseDate = Purchase_Date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
                        String Maintenance_Time = map.get("Maintenance_Time");
                        LocalDate maintenanceDate = LocalDate.parse(Maintenance_Time, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
                        

                        int Maintenance_Cost = Integer.parseInt(map.get("Maintenance_Cost"));
                        String Remarks = map.get("Remarks");
                        int M_state = Integer.parseInt(map.get("state"));
                        // 計算下次維護日
                        String Next_Maintenance_Date = null;
                        ResultSet deviceRs = DBConnect.selectQuery("SELECT * FROM device_record WHERE Device_ID = ?", Device_ID);
                            while (deviceRs.next()) {
                                int interval = deviceRs.getInt("Maintenance_Interval");
                                LocalDate maintenance = maintenanceDate.plusDays(interval);
                                Next_Maintenance_Date = maintenance.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                            }
                        // 取得Vendor_ID
                        ResultSet VendorRs = DBConnect.selectQuery("SELECT * FROM vendor_record WHERE Vendor_Name = ? AND Contact_Person = ?", Vendor_Name, Contact_Person);
                        while (VendorRs.next()) {
                            vendorID = VendorRs.getInt("Vendor_ID");
                        }
                        VendorRs.close();
                                
                        DBConnect.executeUpdate("UPDATE `chick hicks`.`maintenance_record` SET `Device_ID` = ?, `Vendor_ID` = ?, `Maintenance_Item` = ?, `Maintenance_Time` = ?, `Maintenance_Cost` = ?, `Next_Maintenance_Date` = ?, `Remarks` = ?, `state` = ? WHERE (`maintenance_ID` = ?);",Device_ID,vendorID,Maintenance_Item,Maintenance_Time,Maintenance_Cost,Next_Maintenance_Date,Remarks,M_state,maintenanceId);
                        deviceRs.close();

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;
                case "vendor":
                    try {
                        int vendorId = Integer.parseInt(map.get("Vendor_ID"));
                        String vendorName = map.get("Vendor_Name");
                        String contact_person = map.get("Contact_Person");
                        String phone = map.get("Phone");
                        String email = map.get("Email");
                        String address = map.get("Address");
                        String service = map.get("Service_Type");
                        String contractStart = map.get("Contract_Start");
                        String contractEnd = map.get("Contract_End");
                        int V_state = Integer.parseInt(map.get("state"));
                        DBConnect.executeUpdate(
                                "UPDATE `chick hicks`.`vendor_record` SET `Vendor_Name` = ?, `Contact_Person` = ?, `Phone` = ?, `Email` = ?, `Address` = ?, `Service_Type` = ?, `Contract_Start` = ?, `Contract_End` = ?, `state` = ? WHERE (`Vendor_ID`= ?);",vendorName,contact_person,phone,email,address,service,contractStart,contractEnd,V_state,vendorId);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;

                default:
                    exchange.sendResponseHeaders(200, -1);
                    break;

            }

        }
    }
    
    // 定義 handler
    static class InsertDataHandler implements HttpHandler {
        @Override
        public void handle(HttpExchange exchange) throws IOException {
            String body = new BufferedReader(new InputStreamReader(exchange.getRequestBody(), StandardCharsets.UTF_8))
                    .lines().collect(Collectors.joining());
            Map<String, String> map = DBConnect.parseJson(body);
            String targetTable = map.get("table");
            switch (targetTable) {
                case "purchase":

                    String LicensePlate = map.get("license");
                    int id = DBConnect.getNextId("purchase_record", "Order_ID");
                    int ticketId = Integer.parseInt(map.get("ticket"));
                    int quantity = Integer.parseInt(map.get("quantity"));
                    ResultSet rs = DBConnect.selectQuery("SELECT * FROM products WHERE TicketID = ?", ticketId);
                    try {
                        if (rs.next()) {
                            int maxUses = rs.getInt("Max_Uses");
                            int duration = rs.getInt("Duration");
                            String expirationDate = null;

                            // 如果是月費過路權，計算到期日
                            if (ticketId == 3) {
                                LocalDateTime now = LocalDateTime.now();
                                LocalDateTime expiration = now.plusDays(duration);
                                expirationDate = expiration.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
                            }

                            int remainingUses = maxUses * quantity;

                            String purchaseDate = LocalDateTime.now()
                                    .format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

                            // 插入到 purchase_record 表格
                            DBConnect.executeUpdate(
                                    "INSERT INTO purchase_record (Order_ID, License_Plate, Purchase_Date, Ticket_ID, Expiration_Date, Purchase_Quantity, Remaining_Uses, Status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
                                    id, LicensePlate, purchaseDate, ticketId, expirationDate, quantity, remainingUses,
                                    "Active");
                        }
                    } catch (SQLException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                    break;
                case "device":
                    try {
                        int deviceId = DBConnect.getNextId("device_record", "Device_ID");
                        String deviceName = map.get("deviceName");
                        String dateTime = map.get("purchaseDateTime");
                        // if(dateTimeStr == null || dateTimeStr.isEmpty()){
                        // System.out.println("輸入的時間字串為空或為 null");
                        // }
                        // LocalDateTime dateTime = LocalDateTime.parse(dateTimeStr,
                        // DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
                        String price = map.get("price");
                        int Maintenance_Interval = Integer.parseInt(map.get("Maintenance_Interval"));
                        String remark = map.get("remark");
                        DBConnect.executeUpdate(
                                "INSERT INTO device_record (Device_ID, Device_Name,Purchase_Time,Purchase_Amount,Maintenance_Interval,Remarks) VALUES (?, ?, ?, ?, ?, ?)",
                                deviceId, deviceName, dateTime, price, Maintenance_Interval, remark);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;
                case "maintenance":
                    try {
                        int maintenanceId = DBConnect.getNextId("maintenance_record", "maintenance_ID");
                        int deviceID = Integer.parseInt(map.get("deviceID"));
                        int vendorID = Integer.parseInt(map.get("vendorID"));
                        String item = map.get("item");
                        String maintenanceDate = LocalDateTime.now()
                                .format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
                        int cost = Integer.parseInt(map.get("cost"));
                        String remark = map.get("remark");
                        String Next_Maintenance_Date = null;
                        ResultSet deviceRs = DBConnect.selectQuery(
                                "SELECT Device_ID, Device_Name, Maintenance_Interval, Remarks FROM device_record");
                        while (deviceRs.next()) {
                            int targetID = deviceRs.getInt("Device_ID");
                            if (targetID == deviceID) {
                                int interval = deviceRs.getInt("Maintenance_Interval");
                                LocalDateTime now = LocalDateTime.now();
                                LocalDateTime maintenance = now.plusDays(interval);
                                Next_Maintenance_Date = maintenance
                                        .format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
                            }
                        }
                        DBConnect.executeUpdate(
                                "INSERT INTO maintenance_record (maintenance_ID, Device_ID, Vendor_ID, Maintenance_Item, Maintenance_Time, Maintenance_Cost, Next_Maintenance_Date, Remarks) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
                                maintenanceId, deviceID, vendorID, item, maintenanceDate, cost, Next_Maintenance_Date,
                                remark);
                        deviceRs.close();

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;
                case "vendor":
                    try {
                        int vendorId = DBConnect.getNextId("vendor_record", "Vendor_ID");
                        String vendorName = map.get("vendorName");
                        String contact_person = map.get("maintainer");
                        String phone = map.get("phone");
                        String email = map.get("email");
                        String address = map.get("address");
                        String service = map.get("service");
                        String contractStart = map.get("contractStart");
                        String contractEnd = map.get("contractEnd");
                        DBConnect.executeUpdate(
                                "INSERT INTO vendor_record (Vendor_ID, Vendor_Name, Contact_Person, Phone, Email, Address, Service_Type, Contract_Start, Contract_End) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)",
                                vendorId, vendorName, contact_person, phone, email, address, service, contractStart,
                                contractEnd);

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;

                default:
                    exchange.sendResponseHeaders(200, -1);
                    break;

            }

        }
    }

    static class dataHandler implements HttpHandler {
        private String sql;

        // 建構式
        public dataHandler(String sql) {
            this.sql = sql;
        }

        @Override
        public void handle(HttpExchange exchange) throws IOException {
            String response = "";
            StringBuilder json = new StringBuilder();

            json.append("[");
            try {
                ResultSet rs = DBConnect.selectQuery(sql);
                ResultSetMetaData meta = rs.getMetaData();
                int columnCount = meta.getColumnCount();

                boolean firstRow = true;
                while (rs.next()) {
                    if (!firstRow)
                        json.append(",");
                    firstRow = false;

                    json.append("{");
                    for (int i = 1; i <= columnCount; i++) {
                        String columnName = meta.getColumnLabel(i);
                        String value = rs.getString(i);
                        if (i > 1)
                            json.append(",");
                        json.append("\"").append(columnName).append("\":");
                        json.append("\"").append(value == null ? "" : escapeJson(value)).append("\"");
                    }
                    json.append("}");
                }
                rs.getStatement().getConnection().close(); // 關閉連線
            } catch (Exception e) {
                json = new StringBuilder("{\"error\":\"" + e.getMessage() + "\"}");
            }

            json.append("]");

            response = json.toString();
            exchange.getResponseHeaders().set("Content-Type", "text/plain; charset=utf-8");
            exchange.getResponseHeaders().set("Access-Control-Allow-Origin", "*");
            byte[] responseBytes = response.toString().getBytes("UTF-8");
            exchange.sendResponseHeaders(200, responseBytes.length);
            OutputStream os = exchange.getResponseBody();
            os.write(responseBytes);
            os.close();
        }

        private static String escapeJson(String s) {
            return s.replace("\\", "\\\\")
                    .replace("\"", "\\\"")
                    .replace("\n", "\\n")
                    .replace("\r", "\\r");
        }
    }
}
