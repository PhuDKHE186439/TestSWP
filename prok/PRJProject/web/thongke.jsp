<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Biểu đồ thống kê số lượng sản phẩm theo ngày trong tháng</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f0f0f0;
        }
        .header {
            text-align: center;
            padding: 20px;
            background-color: #808080; /* Changed to gray */
            color: black; /* Changed to black */
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .chart-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .chart {
            width: 48%;
            background-color: white;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .back-button {
            display: block;
            width: 150px;
            margin: 20px auto;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Biểu đồ thống kê số lượng sản phẩm theo ngày trong tháng</h1>
    </div>
    
    <div class="chart-container">
        <div class="chart">
            <canvas id="barChart"></canvas>
        </div>
        <div class="chart">
            <canvas id="pieChart"></canvas>
        </div>
    </div>

    <a href="HomeURL" class="back-button">Back to Home</a>

    <c:set var="doanhThu" value="${sessionScope.daily}" />

    <%
        StringBuffer data = new StringBuffer("[");
        int[] doanhThuArray = (int[]) session.getAttribute("data");
        for (int i = 0; i < doanhThuArray.length; i++) {
            data.append(doanhThuArray[i]);
            if (i < doanhThuArray.length - 1) {
                data.append(", ");
            }
        }
        data.append("]");
    %>

    <script>
        var labels = ['Ngày 1', 'Ngày 2', 'Ngày 3', 'Ngày 4', 'Ngày 5', 'Ngày 6', 'Ngày 7', 'Ngày 8', 'Ngày 9', 'Ngày 10', 'Ngày 11', 'Ngày 12', 'Ngày 13', 'Ngày 14', 'Ngày 15', 'Ngày 16', 'Ngày 17', 'Ngày 18', 'Ngày 19', 'Ngày 20', 'Ngày 21', 'Ngày 22', 'Ngày 23', 'Ngày 24', 'Ngày 25', 'Ngày 26', 'Ngày 27', 'Ngày 28', 'Ngày 29', 'Ngày 30'];
        var data = <%=data.toString()%>;

        var barCtx = document.getElementById('barChart').getContext('2d');
        var barChart = new Chart(barCtx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Số lượng sản phẩm theo ngày',
                    data: data,
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        var pieCtx = document.getElementById('pieChart').getContext('2d');
        var pieChart = new Chart(pieCtx, {
            type: 'pie',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Số lượng sản phẩm được đặt mua theo ngày',
                    data: data,
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.7)',
                        'rgba(54, 162, 235, 0.7)',
                        'rgba(255, 205, 86, 0.7)',
                        'rgba(75, 192, 192, 0.7)',
                        'rgba(153, 102, 255, 0.7)',
                        'rgba(255, 159, 64, 0.7)',
                        'rgba(255, 99, 132, 0.7)',
                        'rgba(54, 162, 235, 0.7)',
                        'rgba(255, 205, 86, 0.7)',
                        'rgba(75, 192, 192, 0.7)',
                        'rgba(153, 102, 255, 0.7)',
                        'rgba(255, 159, 64, 0.7)',
                        'rgba(255, 99, 132, 0.7)',
                        'rgba(54, 162, 235, 0.7)',
                        'rgba(255, 205, 86, 0.7)',
                        'rgba(75, 192, 192, 0.7)',
                        'rgba(153, 102, 255, 0.7)',
                        'rgba(255, 159, 64, 0.7)',
                        'rgba(255, 99, 132, 0.7)',
                        'rgba(54, 162, 235, 0.7)',
                        'rgba(255, 205, 86, 0.7)',
                        'rgba(75, 192, 192, 0.7)',
                        'rgba(153, 102, 255, 0.7)',
                        'rgba(255, 159, 64, 0.7)',
                        'rgba(255, 99, 132, 0.7)',
                        'rgba(54, 162, 235, 0.7)',
                        'rgba(255, 205, 86, 0.7)',
                        'rgba(75, 192, 192, 0.7)',
                        'rgba(153, 102, 255, 0.7)',
                        'rgba(255, 159, 64, 0.7)'
                    ]
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false // Remove color legend
                    }
                }
            }
        });
    </script>
</body>
</html>