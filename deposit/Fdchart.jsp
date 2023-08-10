<!DOCTYPE html>
<html>
<head>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
<style>
    #dataTable {
        width: 100%;
    }

    /* Add styles for table-striped */
    #dataTable tbody tr:nth-of-type(odd) {
        background-color: #f2f2f2;
    }

    /* Add styles for table-bordered */
    #dataTable th,
    #dataTable td {
        border: 1px solid #ccc;
        padding: 8px;
    }

    /* Add styles for table-hover */
    #dataTable tbody tr:hover {
        background-color: #f2f2f2;
    }

    /* Add styles for table-responsive */
    @media screen and (max-width: 768px) {
        #dataTable {
            overflow-x: auto;
            display: block;
        }
    }
</style>



</head>
<body>
   
         <div class="fixed-table-container" style="height: 350px; padding-bottom: 28px; margin-left: 20px;">
        <h2 style="text-align: center; background-color: #219ebc;">Deposit Interest Chart</h2>
        <table id="dataTable" style="width: max-content;">
            <thead style="background-color: #8ecae6;">
                <tr >
                    <th class="h5" style="width: 150px;">Scheme Name</th>
                    <th class="h5" style="width: 200px;">Category Name</th>
                    <th class="h5" colspan="3">Period From</th>                  
                    <th class="h5" colspan="3">Period To</th>                   
                    <th class="h5" colspan="2">Amount Slab</th>                   
                    <th class="h5">Interest</th>
                    <th class="h5"> Penal Int.</th>
                </tr>
            
                <tr >
                    <th colspan="2"></th>
                    <th class="h5">Year</th>
                    <th class="h5">Month</th>
                    <th class="h5">Days</th>
                    <th class="h5">Year</th>
                    <th class="h5">Month</th>
                    <th class="h5">Days</th>
                    <th  class="h5">Form Amount</th>
                    <th  class="h5">To Amount</th>
                    <th colspan="2"></th>
                    
                </tr>
            </thead>
        <tbody >
            <!-- Table body content will be populated through JavaScript -->
        </tbody>
    </table>
     </div>
    <script>
        $(document).ready(function () {
            // Function to fetch data from the API and populate the table
            function fetchDataAndPopulateTable() {
                debugger;
                $.ajax({
                    url: "/rest/AccountService/getonlineintrestrate",
                    type: "POST",
                    dataType: "json",
                    success: function (data) {
                        // Data fetched successfully, now populate the table
                        var tableBody = $("#dataTable tbody");
                        tableBody.empty(); // Clear any existing data in the table
                        var store =  data.Data;
                        // Loop through the data and add rows to the table
                        for (var i = 0; i < JSON.parse(store).length; i++) {
                            var row = "<tr>" +
                                "<td >" + JSON.parse(store)[i].schname + "</td>" +
                                "<td>" + JSON.parse(store)[i].catname + "</td>" +
                                "<td>" + JSON.parse(store)[i].fdprdlyear + "</td>" +
                                "<td>" + JSON.parse(store)[i].fdprdlmonth + "</td>" +
                                "<td>" + JSON.parse(store)[i].fdprdldays + "</td>" +
                                 "<td>" + JSON.parse(store)[i].fdprduyear + "</td>" +
                                "<td>" +JSON.parse(store)[i].fdprdumonth + "</td>" +
                                "<td>" + JSON.parse(store)[i].fdprdudays + "</td>" +
                                "<td>" + JSON.parse(store)[i].amtlamt+ "</td>" +
                                "<td>" + JSON.parse(store)[i].amtuamt + "</td>" +
                                "<td >" + JSON.parse(store)[i].fdintroi + "</td>" +
                                "<td>" + JSON.parse(store)[i].fdintproi + "</td>" +
                                "</tr>";
                            tableBody.append(row);
                        }
                    },
                    error: function (xhr, status, error) {
                        console.log("Error fetching data: " + error);
                    }
                });
            }
            // Call the function to populate the table on page load
            fetchDataAndPopulateTable();
        });
    </script>
</body>
</html>
