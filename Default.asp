<%-- The following 4 lines are ASP.NET directives needed when using SharePoint components --%>

<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>

<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%-- The markup and script in the following Content element will be placed in the <head> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-1.9.1.min.js"></script>
    <SharePoint:ScriptLink name="sp.js" runat="server" OnDemand="true" LoadAfterUI="true" Localizable="false" />
    <meta name="WebPartPageExpansion" content="full" />




    <!-- Add your CSS styles to the following file -->
    <link rel="Stylesheet" type="text/css" href="../Content/App.css" />



    <!-- Add your JavaScript to the following file -->
    <script type="text/javascript" src="../Scripts/App.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-1.9.1.js"></script>
     <script type="text/javascript" src="../Scripts/jquery.SPServices-2014.02.min.js"></script>
     <script type="text/javascript" src="../Scripts/jquery.SPServices-2014.02.js"></script>
     <script src="/_layouts/15/SP.UserProfiles.js"></script>
  
   

</asp:Content>

<%-- The markup in the following Content element will be placed in the TitleArea of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
  <a align="center">Expense Report</a>
   
</asp:Content>

<%-- The markup and script in the following Content element will be placed in the <body> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">
 
    <script type="text/javascript">
        $(document).ready(function () {

           


            $('body').on('change', '#ctl00_PlaceHolderMain_ddlExpenseType', function () {
                var id = $('#ctl00_PlaceHolderMain_ddlExpenseType').val();

                if (id == "homeOffice") {
                    $('#hoTable').css('display', 'block');
                    $('#saTable').css('display', 'none');
                    $('#edTable').css('display', 'none');
                } else if (id == "Sales") {
                    $('#hoTable').css('display', 'none');
                    $('#saTable').css('display', 'block');
                    $('#edTable').css('display', 'none');

                } else if (id == "Education") {
                    $('#hoTable').css('display', 'none');
                    $('#saTable').css('display', 'none');
                    $('#edTable').css('display', 'block');

                }
            });

            $('body').on('change', '.Expensehome', function () {
                var lastRow = $('#hdnExpenseHome').val();
                lastRow = lastRow.replace("Total", '');
                var curId = $(this).attr('id');
                curId = curId.replace("Total", '');
                var dataID = $(this).data('id');
                var totalLookup = $('Total' + lastRow).val();
                if ((dataID == lastRow) && $('#Description' + lastRow).val() != "") {
                    // && $('#totalofmiles' + lastRow).val() != "0" || $('#Meals' + lastRow).val() != "" || $('#Lodging' + lastRow).val() != "")

                    var nextid = parseInt(lastRow) + 1;
                    var newId = $('#hdnExpenseHome').val(nextid);

                   
                    var str = "<tr  id='ho" + nextid + "'>";
                    str += "<td><input style='width:150px' class='Expensehome'      data-id='" + nextid + "'    id='date" + nextid + "' type='date'  /></td>";
                    str += "<td><textarea class='Expensehome'   data-id='" + nextid + "'    id='Description" + nextid + "'   type='text' /></td>";
                    str += "<td><input class='Expensehome hoNumberofmiles' data-id='" + nextid + "' data-prefix='ho' id='hoNumberofMiles" + nextid + "' type='text' /></td>";
                    str += "<td><input class='Expensehome hoMileageexp'      id='hoMileageexp" + nextid + "'  data-id='" + nextid + "' data-prefix='ho'   value='.575' type='text'  readonly='readonly' /></td>";
                    str += "<td><input class='Expensehome hosum hosum" + nextid + "  hoTotalofMiles" + nextid + "'  id='hoTotalofMiles" + nextid + "' data-id='" + nextid + "' data-prefix='ho' type='text' readonly='readonly' /></td>";
                    str += "<td><input class='Expensehome hosum hosum" + nextid + "'  id='hoMeals" + nextid + "' data-id='" + nextid + "' data-prefix='ho' type='text' /></td>";
                    str += "<td><input class='Expensehome hosum hosum" + nextid + "'  id='hoLodging" + nextid + "' data-id='" + nextid + "' data-prefix='ho' type='text' /></td>";
                    str += "<td><input class='Expensehome hosum hosum" + nextid + "'  id='hoMisc" + nextid + "' data-id='" + nextid + "' data-prefix='ho' type='text' /></td>";
                    str += "<td><input class='Expensehome hosumtotal hosumtotal" + nextid + "' id='hoTotal" + nextid + "'  data-id='" + nextid + "'  data-prefix='ho' type='text' readonly='readonly' /></td>";
                    str += "</tr>";
                  

                    $('#hoTable #ho' + dataID).after(str);
                }
            });

            $('body').on('change', '.Expensesales', function () {
                var lastRow = $('#hdnExpenseSales').val();
                lastRow = lastRow.replace("Total", '');
                var curId = $(this).attr('id');
                curId = curId.replace("Total", '');
                var dataID = $(this).data('id');
                var totalLookup = $('Total' + lastRow).val();
                if ((dataID == lastRow) && $('#sadescription' + lastRow).val() != "") {
                    // && $('#totalofmiles' + lastRow).val() != "0" || $('#Meals' + lastRow).val() != "" || $('#Lodging' + lastRow).val() != "")

                    var nextid = parseInt(lastRow) + 1;
                    var newId = $('#hdnExpenseSales').val(nextid);
                   

                    var str = "<tr  id='sa" + nextid + "'>";
                    str += "<td><input style='width:150px' class='Expensesales'      data-id='" + nextid + "'    id='date" + nextid + "' type='date'  /></td>";
                    str += "<td><textarea class='Expensesales'   data-id='" + nextid + "'    id='Description" + nextid + "'   type='text' /></td>";
                    str += "<td><input class='Expensesales saNumberofmiles' data-id='" + nextid + "' data-prefix='sa' id='saNumberofMiles" + nextid + "' type='text' /></td>";
                    str += "<td><input class='Expensesales saMileageexp'      id='saMileageexp" + nextid + "'  data-id='" + nextid + "' data-prefix='sa'   value='.575' type='text'  readonly='readonly' /></td>";
                    str += "<td><input class='Expensesales sasum sasum" + nextid + "  saTotalofMiles" + nextid + "'  id='saTotalofMiles" + nextid + "' data-id='" + nextid + "' data-prefix='sa' type='text' readonly='readonly' /></td>";
                    str += "<td><input class='Expensesales sasum sasum" + nextid + "'  id='saMeals" + nextid + "' data-id='" + nextid + "' data-prefix='sa' type='text' /></td>";
                    str += "<td><input class='Expensesales sasum sasum" + nextid + "'  id='saLodging" + nextid + "' data-id='" + nextid + "' data-prefix='sa' type='text' /></td>";
                    str += "<td><input class='Expensesales sasum sasum" + nextid + "'  id='saMisc" + nextid + "' data-id='" + nextid + "' data-prefix='sa' type='text' /></td>";
                    str += "<td><input class='Expensesales' id='saTravedto" + nextid + "' type='text' /></td>";
                    str += "<td><input class='Expensesales' id='saMetwith" + nextid + "'  type='text' /></td>";
                    str += "<td><textarea class='Expensesales' id='saresults" + nextid + "' type='textarea' /></td>";
                    str += "<td><input class='Expensesales sasumtotal sasumtotal" + nextid + "' id='saTotal" + nextid + "'  data-id='" + nextid + "'  data-prefix='sa' type='text' readonly='readonly' /></td>";
                    str += "</tr>";

                    console.log(dataID);

                    $('#saTable #sa' + dataID).after(str);
                }
            })

            $('body').on('change', '.ExpenseEducation', function () {
                var lastRow = $('#hdnExpenseEducation').val();
                lastRow = lastRow.replace("Total", '');
                var curId = $(this).attr('id');
                curId = curId.replace("Total", '');
                var dataID = $(this).data('id');
                var totalLookup = $('Total' + lastRow).val();
                if ((dataID == lastRow) && $('#eddescription' + lastRow).val() != "") {
                    // && $('#totalofmiles' + lastRow).val() != "0" || $('#Meals' + lastRow).val() != "" || $('#Lodging' + lastRow).val() != "")

                    var nextid = parseInt(lastRow) + 1;
                    var newId = $('#hdnExpenseEducation').val(nextid);

                    var str = "<tr  id='" + nextid + "'>";
                    str += "<td><input style='width:150px'  class='ExpenseEducation'      data-id='" + nextid + "'    id='date" + nextid + "' type='date'  /></td>";
                    str += "<td><textarea class='ExpenseEducation'   data-id='" + nextid + "'    id='Description" + nextid + "'   type='text' /></td>";
                    str += "<td><input class='ExpenseEducation edNumberofmiles' data-id='" + nextid + "' data-prefix='ed' id='edNumberofMiles" + nextid + "' type='text' /></td>";
                    str += "<td><input class='Expensesales edMileageexp'      id='edMileageexp" + nextid + "'  data-id='" + nextid + "' data-prefix='ed'   value='.575' type='text'  readonly='readonly' /></td>";
                    str += "<td><input class='ExpenseEducation edsum edsum" + nextid + "  edTotalofMiles" + nextid + "'  id='edTotalofMiles" + nextid + "' data-id='" + nextid + "' data-prefix='ed' type='text' readonly='readonly' /></td>";
                    str += "<td><input class='ExpenseEducation edsum edsum" + nextid + "'  id='edMeals" + nextid + "' data-id='" + nextid + "' data-prefix='ed' type='text' /></td>";
                    str += "<td><input class='ExpenseEducation edsum edsum" + nextid + "'  id='edLodging" + nextid + "' data-id='" + nextid + "' data-prefix='ed' type='text' /></td>";
                    str += "<td><input class='ExpenseEducation edsum edsum" + nextid + "'  id='edMisc" + nextid + "' data-id='" + nextid + "' data-prefix='ed' type='text' /></td>";
                    str += "<td><textarea class='ExpenseEducation' id='education" + nextid + "' type='textarea' /></td>";
                    str += "<td><input class='ExpenseEducation edsumtotal edsumtotal" + nextid + "' id='edTotal" + nextid + "'  data-id='" + nextid + "'  data-prefix='ed' type='text' readonly='readonly' /></td>";
                    str += "</tr>";

                    
                    $('#edTable #ed' + dataID).after(str);

                    //$('#edTable').append(str);
                }
            });

            $('body').on('change', '.Expensevendor', function () {
                var lastRow = $('#hdnExpensevendor').val();
                lastRow = lastRow.replace("vdamount", '');
                var curId = $(this).attr('id');
                curId = curId.replace("vdamount", '');
                var dataID = $(this).data('id');
                var totalLookup = $('vdamount' + lastRow).val();

                if (lastRow == dataID)
                {

                    var nextid = parseInt(lastRow) + 1;
                    var newId = $('#hdnExpensevendor').val(nextid);
                    console.log("nextid :: " + nextid);
                    var str = "<tr>";
                    str += "<td>";
                    str += "<select class='vddept' id='vddept" + nextid + "'>";
                    str += "<option value='0'>Select Departmart/Region</option>";
                    str += "<option value='01'>Central</option>";
                    str += "<option value='03'>Metro</option>";
                    str += "<option value='04'>East</option>";
                    str += "<option value='05'>Southwest</option>";
                    str += "<option value='06'>Sioux Falls</option>";
                    str += "<option value='12'>North</option>";
                    str += "<option value='19'>Sales</option>";
                    str += "<option value='20'>Marketing</option>";
                    str += "<option value='25'>Annuity</option>";
                    str += "<option value='30'>Infomation Technology</option>";
                    str += "<option value='40'>UnderWriting</option>";
                    str += "<option value='50'>Fraternal</option>";
                    str += "<option value='55'>Foundation</option>";
                    str += "<option value='60'>Member Services</option>";
                    str += "<option value='70'>Investments</option>";
                    str += "<option value='80'>Administrator</option>";
                    str += "<option value='81'>President</option>";
                    str += "<option value='82'>Secretary/Treasurer</option>";
                    str += "<option value='83'>Human Resources</option>";
                    str += "<option value='84'>Claims</option>";
                    str += "<option value='85'>Board of Directors</option>";
                    str += "<option value='86'>Legal</option>";
                    str += "<option value='87'>Compliance</option>";
                    str += "<option value='90'>Acounting</option>";
                    str += "<option value='95'>Credit Union</option>"
                    str += "</select>";
                    str += "</td>";
                    str += "<td><input class='Expensevendor' id='code" + nextid + "'  type='text' /></td>";
                    str += "<td>";
                    str += "<select class='acname' id='acname" + nextid + "'>";
                    str += "<option value='0'>Select Account Description</option>";
                    str += "<option value='0551-7200'>OFFICER EXPENSE</option>";
                    str += "<option value='0551-7201'>TRUSTEE EXPENSE</option>";
                    str += "<option value='0551-7202'>COMMITTEE EXPENSE</option>";
                    str += "<option value='0551-7203'>OFFICERS AUTO EXPENSE</option>";
                    str += "<option value='0551-7204'>EMPLOYEES AUTO EXPENSE</option>";
                    str += "<option value='0551-7205'>AGENCY</option>";
                    str += "<option value='0551-7208'>SALES CONFERENCES/MEETINGS</option>";
                    str += "<option value='0552-7210'>ADVERTISING</option>";
                    str += "<option value='0552-7211'>SALES PROMOTION REPS</option>";
                    str += " <option value='0552-7212'>SALES PROMOTION NOVELTIES</option>";
                    str += "<option value='0552-7214'>SALES INCENTIVES</option>";
                    str += "<option value='0552-7215'>DIRECT MAIL</option>";
                    str += "<option value='0552-7216'>FLYERS/INSERTS</option>";
                    str += "<option value='0552-7217'>SPONSORSHIP/TRADE SHOW</option>";
                    str += "<option value='0552-7218'>RAFFLE EXPENSE</option>";
                    str += "<option value='0552-7219'>SALES TRAINING</option>";
                    str += "<option value='0553-7220'>POSTAGE</option>";
                    str += "<option value='0553-7221'>POSTAGE DUE BUSINESS REPLY</option>";
                    str += "<option value='0553-7223'>CELL PHONE </option>";
                    str += "<option value='0553-7224'> TELEPHONE</option>";
                    str += "<option value='0551-7203'>OFFICE SUPPLIES</option>";
                    str += "<option value='0554-7231'>COMMON OFFICE SUPPLIES</option>";
                    str += "<option value='0555-7240'>FURNITURE AND EQUIP EXPENSE</option>";
                    str += " <option value='0555-7241'>MAINTENANCE AGREEMENT EXPENSE</option>";
                    str += "<option value='0555-7242'>EDP EQUIPMENT DEPRECIATION</option>";
                    str += "<option value='0555-7243'>FURNITURE DEPRECIAITON</option>";
                    str += "<option value='0555-7244'>SOFTWARE EXPENSE</option>";
                    str += "<option value='0561-7300'>BOOKS, MAGAZINES</option>";
                    str += "<option value='0561-7301'>EDUCATION</option>";
                    str += "<option value='0566-7350'>GENERAL</option>";
                    str += "<option value='0566-7357'>SALES RECRUITING</option>";
                    str += "<option value='0573-7410'>ANNUAL CONVENTION EXPENSE</option>";
                    str += "<option value='0573-7415'>CONVENTION SEMINARS AND MTGS</option>";
                    str += "<option value='0573-7416'>AFA CONVENTION</option>";
                    str += "<option value='0581-7421'>GRAPHICS, MISC PRINTING</option>";
                    str += "<option value='0583-7430'>MISCELLANEOUS DONATIONS</option>";
                    str += "<option value='0585-7450'>GATHER 4 GOOD </option>";
                    str += "<option value='0585-7460'>GRANTS 4 GOOD</option>";
                    str += "<option value='0585-7510'>FRATERNAL EXPENSES</option>";
                    str += "<option value='0585-7515'>PRIEST GOLF OUTING</option>";
                    str += "<option value='0586-7569'>DISASTER RELIEF - FOUNDATION</option>";
                    str += "<option value='0586-7570'>CAA FOUNDATION EXPENSES</option>";
                    str += "<option value='0586-7571'>CAA FOUNDATION TRUSTEE FEES</option>";
                    str += "<option value='0586-7572'>CREDIT UNION</option>";
                    str += "<option value='0591-7581'>HOME OFFICE EXPENSE</option>";
                    str += "<option value='0602-8020'>LICENSE, FEES</option>";
                    str += "</select>";
                    str += "</td>";
                    str += "<td><input class='Expensevendor' data-id='" + nextid + "' id='accode" + nextid + "' type='text' /></td>";
                    str += "<td><input class='Expensevendor' data-id='" + nextid + "'  id='vdamount" + nextid + "'  type='text' /></td>";
                    str += "</tr>";
                    $('#VdTable').append(str);

                }
            });
            // Vendor Dept Change  //
               
            $('body').on('change', '.vddept', function () {

                var vddeptVal = $(this).val();
                var num = $(this).attr('id');
                num = num.replace("vddept", "");

                $("#code" + num).val(vddeptVal);

            });
            // Account Code Change //

            $('body').on('change', '.acname', function () {
                var acnameVal = $(this).val();
                var num = $(this).attr('id');
                num = num.replace("acname", "");
                $("#accode" + num).val(acnameVal);
            });
            // Number of updates math //

            $('body').on('change', '.hoNumberofmiles, .saNumberofmiles, .edNumberofmiles', function () {
                var sum = 0;
                var num = $(this).data('id');
                var prefix = $(this).data('prefix');
                var a = $('#' + prefix + 'Mileageexp' + num).val();
                var b = $(this).val();

                $('#' + prefix + 'TotalofMiles' + num).val((parseFloat(a) * parseFloat(b)).toFixed(2));
                    
                var tot = $('#' + prefix + 'Total' + num).val();
                if (tot == "")
                    tot = 0;

                   
                $("." + prefix + "sum" + num).each(function () {
                    sum += +$(this).val();
                });
                $('#' + prefix + 'Total' + num).val((sum).toFixed(2));


                sumTotal(prefix);
            });
            // Sum updates Math //
                
            $('body').on("change", ".hosum, .sasum, .edsum" , function () {
                var sum = 0;
                var id = $(this).data('id');
                var prefix = $(this).data('prefix');

                $("." + prefix + "sum" + id).each(function () {
                    sum += +$(this).val();
                });

                $("." + prefix + "sumtotal" + id).val(sum);
                sumTotal(prefix);
            });


            function sumTotal(prefix) {
                var sum = 0;
                $("." + prefix + "sumtotal").each(function () {
                    var num = $(this).attr('id');
                    var prefix = $(this).data('prefix');

                    var tot = $(this).val();
                    if (tot == "")
                        tot = 0;

                    sum += parseFloat(tot);
                });

                $("#" + prefix + "totalSum").text(sum.toFixed(2));
            }
           
            console.log("hello1");
        });
        $('#submit').click(function (e) {
            e.preventDefault
            console.log("hello1");
        });
              function updateListItem() {
                var siteUrl = '/Lists/';
                var clientContext = new SP.ClientContext(siteUrl);
                var oList = clientContext.get_web().get_lists().getByTitle('ExpenseReport');
                console.log('Hello 2');
                this.oListItem = oList.getItemById(3);

                oListItem.set_item('#Name', 'Name');

                oListItem.update();

                clientContext.executeQueryAsync(Function.createDelegate(this, this.onQuerySucceeded), Function.createDelegate(this, this.onQueryFailed));
            }

            function onQuerySucceeded() {

                alert('Item updated!');
            }

            function onQueryFailed(sender, args) {

                alert('Request failed. ' + args.get_message() + '\n' + args.get_stackTrace());
            }
       
            (function ($) {

                $(document).ready(function () {
                    // Ensure that the SP.UserProfiles.js file is loaded before the custom code runs.
                    SP.SOD.executeOrDelayUntilScriptLoaded(loadUserData, 'SP.UserProfiles.js');
                });

                var userProfileProperties;

                function loadUserData() {

                    //Get Current Context	
                    var clientContext = new SP.ClientContext.get_current();

                    //Get Instance of People Manager Class
                    var peopleManager = new SP.UserProfiles.PeopleManager(clientContext);

                    //Get properties of the current user
                    userProfileProperties = peopleManager.getMyProperties();

                    clientContext.load(userProfileProperties);

                    //Execute the Query.
                    clientContext.executeQueryAsync(onSuccess, onFail);

                }

                function onSuccess() {

                    alert(userProfileProperties.get_displayName());

                }

                function onFail(sender, args) {
                    alert("Error: " + args.get_message());
                }

            })(jQuery);
    
</script>

    
  
 <br />
    <div class="Links" style="display:block">
        <a href="https://catholicunited.sharepoint.com/sites/Devtesting/ExpenseReport/Lists/Codes">Codes</a>
        <br />
        <a href="https://catholicunited.sharepoint.com/sites/Devtesting/ExpenseReport/Lists/ExpenseReport">ExpenseReport</a><br />
      
        </div>
        
           
           
          
    </div>
    <br /><br />
   <form id="expensereport">
    <table class="Userinput" >
      <tbody><tr class="Header"><td colspan="4">Expense Report form please fill out all Fields marked with a *</td></tr>
          <tr>
              <td>Name:</td>
        <td> <input type="text"  id="Name"/></td>
        <td>Date/Week Of:</td>
        <td><input style="width:150px" type="date" name="Dateof" title="Dateof"  /></td>
      </tr>
      <tr>       
        <td>Region/Department:</td>
        <td><input type="text" name="dept" title="dept" id="dept" /></td>
        <td>Supervisor:</td>
        <td><input type="text" name="Manager" title="Manager"  /></td>
      </tr>
      <tr>
        <td>Purpose of Expense:</td>
        <td><input type="text" name="Purposeofexpense" title="Purposeofexpense"/></td>
        <td>Ext/Phone:</td>
        <td><input type="tel" name="Phone" title="Phone" /></td>
          </tr>
       <tr>
        <td>Expense Type:</td>
        <td> 

            <!-- Drop Down Selction for Home office, Sales or Education-->

            <select name="ctl00$PlaceHolderMain$ddlExpenseType" id="ctl00_PlaceHolderMain_ddlExpenseType">
		<option value="">Select Expense Type...</option>
		<option value="homeOffice">Home Office</option>
		<option value="Sales">Sales</option>
		<option value="Education">Convention/Education</option>

	</select>
         
        </td>
</tr>
 </tbody >
          </table>
      <input class="Expensesales"  id="hdnExpenseSales" value="5" type="hidden" />
      <input class="Expensehome"  id="hdnExpenseHome" value="5" type="hidden" />
      <input class="ExpenseEducation"  id="hdnExpenseEducation" value="5" type="hidden" />
    <input class="Expensevendor"  id="hdnExpensevendor" value="3" type="hidden" />
     
    <!-- Home Office Table Start --> 
      <div class="MainTable">
  <table id="hoTable"  style="display: none;">
       <tbody><tr><br /><td colspan="9"><hr /><br /></td></tr>
      <tr class="Header">
        <td class="Expensehome">Date</td>
        <td class="Expensehome">Description</td>
        <td class="Expensehome"> Number of Miles</td>
        <td class="Expensehome"> Mileage Exp</td>
        <td class="Expensehome"> Total Miles</td>
        <td class="Expensehome">Meals</td>
        <td class="Expensehome">Lodging</td>
        <td class="Expensehome">Misc.</td>
        <td class="Expensehome">Total</td>
          
      </tr>
       <tr id="ho1">
        <td><input style="width:150px" class="Expensehome" id="date1"  data-id="1" data-prefix="ho" type="date"/></td>
        <td><textarea class="Expensehome" id="Description1" data-id="1" data-prefix="ho" ></textarea></td>
        <td><input class="Expensehome hoNumberofmiles" id="hoNumberofMiles1" data-id="1" data-prefix="ho" name="Numberofmiles1" type="text" /></td>
        <td><input class="Expensehome" id="hoMileageexp1"  data-id="1" data-prefix="ho" value=".575"  name="Mileageexp1" type="text"  readonly="readonly" /></td>
        <td><input class="Expensehome hosum hosum1 TotalofMiles" id="hoTotalofMiles1"  data-id="1" data-prefix="ho" value="0"    name="TotalofMiles1" type="text" readonly='readonly' /></td>
        <td><input class="Expensehome hosum hosum1" id="Meals1" data-id="1" data-prefix="ho"  type="text"/></td>
        <td><input class="Expensehome hosum hosum1"  data-prefix="ho" data-id="1" id="Lodging1" type="text" /></td>
        <td><input class="Expensehome hosum hosum1"  data-prefix="ho" data-id="1" id="Misc1"  type="text"/></td>
        <td><input class="Expensehome hosumtotal hosumtotal1" data-prefix="ho" data-id="1" id="hoTotal1"  type="text" readonly='readonly' /></td>
      </tr>
      <tr id="ho2"><td><input style="width:150px" class="Expensehome" id="date2" data-prefix="ho" type="date" /></td>
          <td><textarea class="Expensehome" id="Description2" data-id="2" data-prefix="ho"  ></textarea></td>
          <td><input class="Expensehome hoNumberofmiles" name="NumberofMiles2" data-id="2" data-prefix="ho"  id="hoNumberofMiles2" type="text"  /></td>
          <td><input class="Expensehome" id="hoMileageexp2" data-prefix="ho" value=".575" type="text"  readonly="readonly" /></td>
          <td><input class="Expensehome hosum hosum2 TotalofMiles" id="hoTotalofMiles2" data-id="2" data-prefix="ho" value="0"  type="text" readonly='readonly'  /></td>
          <td><input class="Expensehome hosum hosum2"  id="Meals2" data-id="2" data-prefix="ho" type="text"  /></td>
          <td><input class="Expensehome hosum hosum2 " data-id="2" data-prefix="ho" id="Lodging2" type="text"  /></td>
          <td><input class="Expensehome hosum hosum2 " data-id="2" data-prefix="ho" id="Misc2" data-prefix="ho" type="text" /></td>
          <td><input class="Expensehome hosumtotal hosumtotal2 " data-id="2" data-prefix="ho" id="hoTotal2" type="text" readonly="readonly"/></td>
      </tr>
      <tr id="ho3"><td><input style="width:150px" class="Expensehome" id="date3" data-prefix="ho" type="date" /></td>
          <td><textarea class="Expensehome" id="Description3"  data-id="3" data-prefix="ho"  ></textarea></td>
          <td><input class="Expensehome hoNumberofmiles" id="hoNumberofMiles3" data-id="3" data-prefix="ho" type="text"  /></td>
          <td><input class="Expensehome" id="hoMileageexp3" data-prefix="ho" value=".575" type="text" readonly="readonly" /></td>
          <td><input class="Expensehome hosum hosum3 TotalofMiles" data-id="3" data-prefix="ho" value="0"  id="hoTotalofMiles3" type="text"  readonly='readonly' /></td>
          <td><input class="Expensehome hosum hosum3" data-id="3" data-prefix="ho" id="Meals3" type="text"  /></td>
          <td><input class="Expensehome hosum hosum3" data-id="3" data-prefix="ho" id="Lodging3" type="text"  /></td>
          <td><input class="Expensehome hosum hosum3" data-id="3" data-prefix="ho" id="Misc3" data-prefix="ho" type="text" /></td>
          <td><input class="Expensehome hosumtotal hosumtotal3" data-id="3" data-prefix="ho" id="hoTotal3" type="text"  readonly="readonly"  /></td>
      </tr>
      <tr id="ho4"><td><input style="width:150px" class="Expensehome" id="date4" data-prefix="ho" type="date" /></td>
          <td><textarea class="Expensehome" id="Description4" data-id="4" data-prefix="ho" ></textarea></td>
          <td><input class="Expensehome hoNumberofmiles" id="hoNumberofMiles4" data-id="4" data-prefix="ho" type="text"  /></td>
          <td><input class="Expensehome" id="hoMileageexp4" data-prefix="ho" value=".575" type="text" readonly="readonly"  /></td>
           <td><input class="Expensehome hosum hosum4" data-id="4" data-prefix="ho" value="0"  id="hoTotalofMiles4" type="text" readonly='readonly' /></td>
          <td><input class="Expensehome hosum hosum4" data-id="4" data-prefix="ho" id="Meals4" type="text"  /></td>
          <td><input class="Expensehome hosum hosum4" data-id="4" data-prefix="ho" id="Lodging4" type="text"  /></td>
          <td><input class="Expensehome hosum hosum4" data-id="4" data-prefix="ho"" id="Misc4" type="text" /></td>
          <td><input class="Expensehome hosumtotal hosumtotal4" data-id="4" data-prefix="ho" id="hoTotal4" type="text"  readonly="readonly"  /></td>
      </tr>
      <tr id="ho5"><td><input style="width:150px" class="Expensehome" id="date5" data-prefix="ho"  type="date" /></td>
          <td><textarea class="Expensehome" id="Description5" data-id="5" data-prefix="ho" ></textarea></td>
          <td><input class="Expensehome hoNumberofmiles" data-prefix="ho" data-id="5" id="hoNumberofMiles5" type="text"  /></td>
          <td><input class="Expensehome" data-id="5" data-prefix="ho" id="hoMileageexp5" value=".575" type="text" readonly="readonly"  /></td>
          <td><input class="Expensehome hosum hosum5" data-id="5" data-prefix="ho" value="0"  id="hoTotalofMiles5" type="text"  readonly='readonly' /></td>
          <td><input class="Expensehome hosum hosum5" data-id="5" data-prefix="ho" id="Meals5"  type="text"  /></td>
          <td><input class="Expensehome hosum hosum5" data-id="5" data-prefix="ho" id="Lodging5" type="text"  /></td>
          <td><input class="Expensehome hosum hosum5" data-id="5" data-prefix="ho" id="Misc5" type="text"  /></td>
          <td><input class="Expensehome hosumtotal hosumtotal5" value="0" data-id="5" data-prefix="ho" id="hoTotal5" type="text"  readonly="readonly"  /></td>
      </tr>
      <tr><td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td>
              <label id="hototalSum" />
            </td>
      </tr>
           </tbody>
      </table>

          <!-- Sales Table Start -->
          
          
           
          <table id="saTable"  style="display: none;">
              <tbody><tr><td colspan="12"><hr /><br /></td></tr>
          <tr class="Header">
        <td class="Expensesales">Date</td>
        <td class="Expensesales">Description</td>
        <td class="Expensesales">Number of Miles</td>
        <td class="Expensesales">Mileage Exp</td>
        <td class="Expensesales">Total Miles</td>
        <td class="Expensesales">Meals</td>
        <td class="Expensesales">Lodging</td>
        <td class="Expensesales">Misc.</td>
        <td class="Expensesales">Traveled To</td>
        <td class="Expensesales">Met With</td>
        <td class="Expensesales">Results</td>
        <td class="Expensesales">Total</td>
     
      </tr>
       <tr id="sa1">
        <td><input style="width:150px" class="Expensesales" id="sadate1" data-id="1" data-prefix="sa" type="date" /></td>
        <td><textarea class="Expensesales" id="sadescription1" data-id="1" data-prefix="sa"></textarea></td>
        <td><input class="Expensesales saNumberofmiles" id="saNumberofMiles1" data-id="1" data-prefix="sa" type="text" /></td>
        <td><input class="Expensesales" id="saMileageexp1" data-id="1" data-prefix="sa" value=".575" type="text" readonly="readonly" /></td>
        <td><input class="Expemsesales sasum sasum1" data-id="1" data-prefix="sa"  id="saTotalofMiles1"  type="text"  readonly='readonly'/></td>
        <td><input class="Expensesales sasum sasum1" data-id="1" data-prefix="sa" id="saMeals1"  type="text" /></td>
        <td><input class="Expensesales sasum sasum1" data-id="1" data-prefix="sa" id="saLodging1" type="text" /></td>
         <td><input class="Expensesales sasum sasum1"  data-prefix="sa" data-id="1" id="saMisc1"  type="text"/></td>
        <td><input class="Expensesales" id="saTravedto1" data-id="1" data-prefix="sa" type="text" /></td>
        <td><input class="Expensesales" id="saMetwith1" data-id="1" data-prefix="sa" type="text" /></td>
        <td><textarea class="Expensesales" id="saresults1" data-prefix="sa"></textarea></td>
        <td><input class="Expensesales sasumtotal sasumtotal1" data-id="1" data-prefix="sa" id="saTotal1" type="text"  readonly="readonly" /></td>
   
      </tr>
      <tr id="sa2">
          <td><input style="width:150px" class="Expensesales" id="sadate2" data-id="2" data-prefix="sa" type="date" /></td>
          <td><textarea class="Expensesales" id="sadescription2" data-id="2" data-prefix="sa"></textarea></td>
          <td><input class="Expensesales saNumberofmiles" id="saNumberofMiles2" data-id="2" data-prefix="sa" type="text" /></td>
          <td><input class="Expensesales" id="saMileageexp2" data-id="2" data-prefix="sa" value=".575" type="text" readonly="readonly" /></td>
          <td><input class="Expensesales sasum sasum2" data-id="2" data-prefix="sa" id="saTotalofMiles2" type="text" readonly='readonly' /></td>
          <td><input class="Expensesales sasum sasum2" data-id="2" data-prefix="sa" id="saMeals2" type="text" /></td>
          <td><input class="Expensesales sasum sasum2" data-id="2" data-prefix="sa" id="saLodging2" type="text" /></td>
           <td><input class="Expensesales sasum sasum2"  data-prefix="sa" data-id="2" id="saMisc2"  type="text"/></td>
          <td><input class="Expensesales" id="saTravedto2" data-id="2" data-prefix="sa" type="text" /></td>
          <td><input class="Expensesales" id="saMetwith2" data-id="2" data-prefix="sa" type="text" /></td>
          <td><textarea class="Expensesales" id="saresults2" data-id="2" data-prefix="sa"></textarea></td>
          <td><input class="Expensesales sasumtotal sasumtotal2" data-id="2" data-prefix="sa" id="saTotal2" type="text"  readonly="readonly" /></td>
          
      </tr>
      <tr id="sa3">
          <td><input style="width:150px" class="Expensesales" id="sadate3" data-id="3" data-prefix="sa" type="date" /></td>
          <td><textarea class="Expensesales" id="sadescription3" data-id="3" data-prefix="sa"></textarea></td>
          <td><input class="Expensesales saNumberofmiles" id="saNumberofMiles3" data-id="3" data-prefix="sa" type="text" /></td>
          <td><input class="Expensesales" id="saMileageexp3" data-id="3" data-prefix="sa" value=".575" type="text" readonly="readonly" /></td>
          <td><input class="Expensesales sasum sasum3" data-id="3" data-prefix="sa" id="saTotalofMiles3" type="text" readonly='readonly' /></td>
          <td><input class="Expensesales sasum sasum3" data-id="3" data-prefix="sa" id="saMeals3"  type="text" /></td>
          <td><input class="Expensesales sasum sasum3" data-id="3" data-prefix="sa" id="saLodging3" type="text" /></td>
          <td><input class="Expensesales sasum sasum3"  data-prefix="sa" data-id="3" id="saMisc3"  type="text"/></td>
          <td><input class="Expensesales" id="saTravedto3" data-id="3" data-prefix="sa" type="text" /></td>
          <td><input class="Expensesales" id="saMetwith3" data-id="3" data-prefix="sa"  type="text" /></td>
          <td><textarea class="Expensesales" id="saresults3" data-id="3"  data-prefix="sa" ></textarea></td>
          <td><input class="Expensesales sasumtotal sasumtotal3" data-id="3"  data-prefix="sa" id="saTotal3" type="text"  readonly="readonly" /></td>
         
      </tr>
      <tr id="sa4">
          <td><input style="width:150px" class="Expensesales" id="sadate4" data-id="4"  data-prefix="sa" type="date" /></td>
          <td><textarea class="Expensesales" id="sadescription4" data-id="4" data-prefix="sa"></textarea></td>
          <td><input class="Expensesales saNumberofmiles" id="saNumberofMiles4" data-id="4" data-prefix="sa" type="text" /></td>
          <td><input class="Expensesales" id="saMileageexp4" data-id="4" data-prefix="sa" value=".575" type="text" readonly="readonly" /></td>
          <td><input class="Expensesales sasum sasum4" data-id="4" data-prefix="sa" id="saTotalofMiles4" type="text" readonly='readonly' /></td>
          <td><input class="Expensesales sasum sasum4" data-id="4" data-prefix="sa" id="saMeals4" type="text" /></td>
          <td><input class="Expensesales sasum sasum4" data-id="4" data-prefix="sa" id="saLodging4" type="text" /></td>
           <td><input class="Expensesales sasum sasum4"  data-prefix="sa" data-id="4" id="saMisc4"  type="text"/></td>
          <td><input class="Expensesales" id="saTravedto4" data-id="4" data-prefix="sa" type="text" /></td>
          <td><input class="Expensesales" id="saMetwith4" data-id="4" data-prefix="sa"  type="text" /></td>
          <td><textarea class="Expensesales" id="saresults4" data-id="4"  data-prefix="sa"></textarea></td>
          <td><input class="Expensesales sasumtotal sasumtotal4" data-id="4"  data-prefix="sa" id="saTotal4" type="text"  readonly="readonly" /></td>
          


      </tr>
      <tr id="sa5">
          <td><input style="width:150px" class="Expensesales" id="sadate5" data-id="5" data-prefix="sa" type="date" /></td>
          <td><textarea class="Expensesales" id="sadescription5" data-id="5" data-prefix="sa"></textarea></td>
          <td><input class="Expensesales saNumberofmiles" id="saNumberofMiles5" data-id="5" data-prefix="sa" type="text" /></td>
          <td><input class="Expensesales" id="saMileageexp5" value=".575" type="text" readonly="readonly" /></td>
          <td><input class=" Expensesales sasum sasum5" data-id="5" data-prefix="sa" id="saTotalofMiles5" type="text" readonly='readonly' /></td>
          <td><input class="Expensesales sasum sasum5" data-id="5" data-prefix="sa" id="saMeals5"  type="text" /></td>
          <td><input class="Expensesales sasum sasum5" data-id="5" data-prefix="sa" id="saLodging5" type="text" /></td>
           <td><input class="Expensesales sasum sasum5"  data-prefix="sa" data-id="5" id="saMisc5"  type="text"/></td>
          <td><input class="Expensesales" id="saTravedto5" data-id="5" data-prefix="sa" type="text" /></td>
          <td><input class="Expensesales" id="saMetwith5" data-id="5" data-prefix="sa" type="text" /></td>
          <td><textarea class="Expensesales" id="saresults5" data-id="5"  data-prefix="sa"></textarea></td>
          <td><input class="Expensesales sasumtotal sasumtotal5" data-id="5"  data-prefix="sa" value="0"  id="saTotal5" type="text"  readonly="readonly" /></td>
          
      </tr>
                   <tr>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td>
              <label id="satotalSum" />
            </td>
      </tr>
                  </tbody>
</table>
          
          <!-- Education/Convention Table Start --> 
          
          <table id="edTable"  style="display: none;">
      <tbody><tr><td colspan="10"><hr /><br /></td></tr>
        <tr class="Header">
        <td class="ExpenseEducation">Date</td>
        <td class="ExpenseEducation">Description</td>
        <td class="ExpenseEducation"> Number of Miles</td>
        <td class="ExpenseEducation"> Mileage Exp</td>
        <td class="ExpenseEducation"> Total Miles</td>
        <td class="ExpenseEducation">Meals</td>
        <td class="ExpenseEducation">Lodging</td>
        <td class="ExpenseEducation">Misc.</td>
        <td class="ExpenseEducation">School/Convention</td>
        <td class="ExpenseEducation">Total</td>
      </tr>
      
       <tr id="ed1">
          <td><input style="width:150px" class="ExpenseEducation" id="eddate1" data-id="1"  data-prefix="ed"  type="date" /></td>
          <td><textarea class="ExpenseEducation" id="eddescription1" data-id="1" data-prefix="ed"></textarea></td>
          <td><input class="ExpenseEducation edNumberofmiles" id="edNumberofMiles1" data-id="1" data-prefix="ed" type="text" /></td>
          <td><input class="ExpenseEducation" id="edMileageexp1" data-id="1" data-prefix="ed" value=".575" type="text" readonly="readonly" /></td>
          <td><input class="ExpenseEducation edsum edsum1" data-id="1" data-prefix="ed" id="edTotalofMiles1" type="text" readonly='readonly' /></td>
          <td><input class="ExpenseEducation edsum edsum1" data-id="1" data-prefix="ed" id="edMeals1"  type="text" /></td>
          <td><input class="ExpenseEducation edsum edsum1" data-id="1" data-prefix="ed" id="edLodging1" type="text" /></td>
          <td><input class="ExpenseEducationedsum edsum1" data-id="1" data-prefix="ed" id="edMisc1"  type="text" /></td>
          <td><textarea class="ExpenseEducation" id="education1" data-id="1"></textarea></td>
          <td><input class="ExpenseEducation edsumtotal edsumtotal1" data-id="1" data-prefix="ed" id="edTotal1" type="text"  readonly="readonly" /></td>
      </tr>
      <tr id="ed2">
          <td><input style="width:150px" class="ExpenseEducation" id="eddate2" data-id="2" data-prefix="ed" type="date" /></td>
          <td><textarea class="ExpenseEducation" id="eddescription2" data-id="2" data-prefix="ed"></textarea></td>
          <td><input class="ExpenseEducation edNumberofmiles" id="edNumberofMiles2" data-id="2" data-prefix="ed" type="text"/></td>
          <td><input class="ExpenseEducation" id="edMileageexp2" data-id="2" data-prefix="ed" value=".575" type="text" readonly="readonly" /></td>
          <td><input class="ExpenseEducation edsum edsum2" data-id="2" data-prefix="ed" id="edTotalofMiles2" type="text" readonly='readonly' /></td>
          <td><input class="ExpenseEducation edsum edsum2" data-id="2" data-prefix="ed" id="edMeals2" type="text" /></td>
          <td><input class="ExpenseEducation edsum edsum2" data-id="2" data-prefix="ed" id="edLodging2" type="text" /></td>
          <td><input class="ExpenseEducation edsum edsum2" data-id="2" data-prefix="ed" id="edMisc2" type="text" /></td>
          <td><textarea class="ExpenseEducation" id="education2" data-id="2" data-prefix="ed"></textarea></td>
          <td><input class="ExpenseEducation edsumtotal edsumtotal2" data-id="2" data-prefix="ed" id="edTotal2" type="text"  readonly="readonly" /></td>
      </tr>
      <tr id="ed3">
          <td><input style="width:150px" class="ExpenseEducation" id="eddate3" data-id="3" data-prefix="ed" type="date" /></td>
          <td><textarea class="ExpenseEducation" id="eddescription3" data-id="3" data-prefix="ed"></textarea></td>
          <td><input class="ExpenseEducation edNumberofmiles" id="edNumberofMiles3" data-id="3" data-prefix="ed" type="text" /></td>
          <td><input class="ExpenseEducation" id="edMileageexp3" data-id="3" data-prefix="ed" value=".575" type="text" readonly="readonly" /></td>
          <td><input class="ExpenseEducation edsum edsum3" data-id="3" data-prefix="ed" id="edTotalofMiles3" type="text" readonly='readonly' /></td>
          <td><input class="ExpenseEducation edsum edsum3" data-id="3" data-prefix="ed" id="edMeals3"  type="text" /></td>
          <td><input class="ExpenseEducation edsum edsum3" data-id="3" data-prefix="ed" id="edLodging3" type="text" /></td>
          <td><input class="ExpenseEducation edsum edsum3" data-id="3" data-prefix="ed" id="edMisc3" type="text" /></td>
          <td><textarea class="ExpenseEducation" id="education3" data-id="3" data-prefix="ed"></textarea></td>
          <td><input class="ExpenseEducation edsumtotal edsumtotal3" data-id="3" data-prefix="ed" id="edTotal3" type="text"  readonly="readonly" /></td>
      </tr>
      <tr id="ed4">
          <td><input style="width:150px" class="ExpenseEducation" id="eddate4" data-id="4" data-prefix="ed" type="date" /></td>
          <td><textarea class="ExpenseEducation" id="eddescription4" data-prefix="ed" data-id="4"></textarea></td>
          <td><input class="ExpenseEducation edNumberofmiles" id="edNumberofMiles4" data-id="4" data-prefix="ed" type="text" /></td>
          <td><input class="ExpenseEducation" id="edMileageexp4" data-id="4" data-prefix="ed" value=".575" type="text" readonly="readonly" /></td>
          <td><input class="ExpenseEducation edsum edsum4" data-id="4" data-prefix="ed" id="edTotalofMiles4" type="text" readonly='readonly' /></td>
          <td><input class="ExpenseEducation edsum edsum4" data-id="4" data-prefix="ed" id="edMeals4" type="text" /></td>
          <td><input class="ExpenseEducation edsum edsum4" data-id="4" data-prefix="ed" id="edLodging4" type="text" /></td>
          <td><input class="ExpenseEducation edsum edsum4" data-id="4" data-prefix="ed" id="edMisc4" type="text" /></td>
          <td><textarea class="ExpenseEducation" id="education4" data-id="4" data-prefix="ed"></textarea></td>
          <td><input class="ExpenseEducation edsumtotal edsumtotal4" data-id="4" data-prefix="ed" id="edTotal4" type="text"  readonly="readonly" /></td>
      </tr>
      <tr id="ed5">
          <td><input style="width:150px" class="ExpenseEducation" id="eddate5" data-id="5" data-prefix="ed" type="date" /></td>
          <td><textarea class="ExpenseEducation" id="eddescription5" data-prefix="ed" data-id="5"></textarea></td>
          <td><input class="ExpenseEducation edNumberofmiles" id="edNumberofMiles5" data-id="5" data-prefix="ed" type="text" /></td>
          <td><input class="ExpenseEducation" id="edMileageexp5" data-id="5" data-prefix="ed" value=".575" type="text" readonly="readonly"/></td>
          <td><input class="ExpenseEducation edsum edsum5" data-id="5" data-prefix="ed" id="edTotalofMiles5" type="text"  readonly='readonly' /></td>
          <td><input class="ExpenseEducation edsum edsum5" data-id="5" data-prefix="ed" id="edMeals5"  type="text" /></td>
          <td><input class="ExpenseEducation edsum edsum5" data-id="5" data-prefix="ed" id="edLodging5" type="text" /></td>
          <td><input class="ExpenseEducation edsum edsum5" data-id="5" data-prefix="ed" id="edMisc5"   type="text" /></td>
          <td><textarea class="ExpenseEducation" id="education5" data-prefix="ed"></textarea></td>
          <td><input class="ExpenseEducation edsumtotal edsumtotal5" data-id="5" data-prefix="ed" id="edTotal5" type="text"  readonly="readonly" /></td>
      </tr>
           <tr>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
         <td></td>
          <td>
              <label id="edtotalSum" />
            </td>
      </tr>
     </tbody>
      </table> 
            </div>

    <!-- Vendor Code Table Start --> 
    
    <br />
    <table id="VdTable" class="vdTable">
         <tbody><tr><td colspan="5"><hr /><br /></td></tr>
        <tr class="Header">
        <td class="Expensevendor">Dept Name</td>
        <td class="Expensevendor">Code</td>
        <td class="Expensevendor">Account Name</td>
        <td class="Expensevendor">Account Code</td>
        <td class="Expensevendor">Amount</td>
         </tr>
          <tr>
              <td>
                    <select  class="vddept" data-id="1" id="vddept01" >
                       <option value='0'>Select Departmart/Region</option>
                       <option value='01'>Central</option>
                        <option value='03'>Metro</option>
                        <option value='04'>East</option>
                        <option value='05'>Southwest</option>
                        <option value='06'>Sioux Falls</option>
                        <option value='12'>North</option>
                        <option value='19'>Sales</option>
                        <option value='20'>Marketing</option>
                        <option value='25'>Annuity</option>
                        <option value='30'>Infomation Technology</option>
                        <option value='40'>UnderWriting</option>
                        <option value='50'>Fraternal</option>
                        <option value='55'>Foundation</option>
                        <option value='60'>Member Services</option>
                        <option value='70'>Investments</option>
                        <option value='80'>Administrator</option>
                        <option value='81'>President</option>
                        <option value='82'>Secretary/Treasurer</option>
                        <option value='83'>Human Resources</option>
                        <option value='84'>Claims</option>
                        <option value='85'>Board of Directors</option>
                        <option value='86'>Legal</option>
                        <option value='87'>Compliance</option>
                        <option value='90'>Acounting</option>
                        <option value='95'>Credit Union</option>
                  </select>
              </td>
              <td><input class="Expensevendor" data-id="1" id="code01" type="text" readonly="readonly" /></td>
               <td>
               <select data-id="1" id="acname01" class="acname">
                      <option value="0">Select Account Description</option>
                      <option value="0551-7200">OFFICER EXPENSE</option>
                      <option value="0551-7201">TRUSTEE EXPENSE</option>
                      <option value="0551-7202">COMMITTEE EXPENSE</option>
                      <option value="0551-7203">OFFICERS AUTO EXPENSE</option>
                      <option value="0551-7204">EMPLOYEES AUTO EXPENSE</option>
                      <option value="0551-7205">AGENCY</option>
                      <option value="0551-7208">SALES CONFERENCES/MEETINGS</option>
                      <option value="0552-7210">ADVERTISING</option>
                      <option value="0552-7211">SALES PROMOTION REPS</option>
                      <option value="0552-7212">SALES PROMOTION NOVELTIES</option>
                      <option value="0552-7214">SALES INCENTIVES</option>
                      <option value="0552-7215">DIRECT MAIL</option>
                      <option value="0552-7216">FLYERS/INSERTS</option>
                      <option value="0552-7217">SPONSORSHIP/TRADE SHOW</option>
                      <option value="0552-7218">RAFFLE EXPENSE</option>
                      <option value="0552-7219">SALES TRAINING</option>
                      <option value="0553-7220">POSTAGE</option>
                      <option value="0553-7221">POSTAGE DUE BUSINESS REPLY</option>
                      <option value="0553-7223">CELL PHONE </option>
                      <option value="0553-7224"> TELEPHONE</option>
                      <option value="0551-7203">OFFICE SUPPLIES</option>
                      <option value="0554-7231">COMMON OFFICE SUPPLIES</option>
                      <option value="0555-7240">FURNITURE AND EQUIP EXPENSE</option>
                      <option value="0555-7241">MAINTENANCE AGREEMENT EXPENSE</option>
                      <option value="0555-7242">EDP EQUIPMENT DEPRECIATION</option>
                      <option value="0555-7243">FURNITURE DEPRECIAITON</option>
                      <option value="0555-7244">SOFTWARE EXPENSE</option>
                      <option value="0561-7300">BOOKS, MAGAZINES</option>
                      <option value="0561-7301">EDUCATION</option>
                      <option value="0566-7350">GENERAL</option>
                      <option value="0566-7357">SALES RECRUITING</option>
                      <option value="0573-7410">ANNUAL CONVENTION EXPENSE</option>
                      <option value="0573-7415">CONVENTION SEMINARS AND MTGS</option>
                      <option value="0573-7416">AFA CONVENTION</option>
                      <option value="0581-7421">GRAPHICS, MISC PRINTING</option>
                      <option value="0583-7430">MISCELLANEOUS DONATIONS</option>
                      <option value="0585-7450">GATHER 4 GOOD </option>
                      <option value="0585-7460">GRANTS 4 GOOD</option>
                      <option value="0585-7510">FRATERNAL EXPENSES</option>
                      <option value="0585-7515">PRIEST GOLF OUTING</option>
                      <option value="0586-7569">DISASTER RELIEF - FOUNDATION</option>
                      <option value="0586-7570">CAA FOUNDATION EXPENSES</option>
                      <option value="0586-7571">CAA FOUNDATION TRUSTEE FEES</option>
                      <option value="0586-7572">CREDIT UNION</option>
                      <option value="0591-7581">HOME OFFICE EXPENSE</option>
                      <option value="0602-8020">LICENSE, FEES</option>
                  </select>
              </td>
              <td><input class="Expensevendor" data-id="1" id="accode01" type="text"  readonly="readonly" /></td>
              <td><input class="Expensevendor" data-id="1" id="vdamount1" type="text" /></td>
              </tr>
        <tr>
              <td>
                <select data-id="1" id="vddept02" class="vddept">
                      <option value='0'>Select Departmart/Region</option>
                       <option value='01'>Central</option>
                        <option value='03'>Metro</option>
                        <option value='04'>East</option>
                        <option value='05'>Southwest</option>
                        <option value='06'>Sioux Falls</option>
                        <option value='12'>North</option>
                        <option value='19'>Sales</option>
                        <option value='20'>Marketing</option>
                        <option value='25'>Annuity</option>
                        <option value='30'>Infomation Technology</option>
                        <option value='40'>UnderWriting</option>
                        <option value='50'>Fraternal</option>
                        <option value='55'>Foundation</option>
                        <option value='60'>Member Services</option>
                        <option value='70'>Investments</option>
                        <option value='80'>Administrator</option>
                        <option value='81'>President</option>
                        <option value='82'>Secretary/Treasurer</option>
                        <option value='83'>Human Resources</option>
                        <option value='84'>Claims</option>
                        <option value='85'>Board of Directors</option>
                        <option value='86'>Legal</option>
                        <option value='87'>Compliance</option>
                        <option value='90'>Acounting</option>
                        <option value='95'>Credit Union</option>

                  </select>
              </td>
              <td><input class="Expensevendor" data-id="1" id="code02" type="text" readonly="readonly" /></td>
               <td>

              
               <select data-id="2" id="acname02" class="acname">
                      <option value="0">Select Account Description</option>
                      <option value="0551-7200">OFFICER EXPENSE</option>
                      <option value="0551-7201">TRUSTEE EXPENSE</option>
                      <option value="0551-7202">COMMITTEE EXPENSE</option>
                      <option value="0551-7203">OFFICERS AUTO EXPENSE</option>
                      <option value="0551-7204">EMPLOYEES AUTO EXPENSE</option>
                      <option value="0551-7205">AGENCY</option>
                      <option value="0551-7208">SALES CONFERENCES/MEETINGS</option>
                      <option value="0552-7210">ADVERTISING</option>
                      <option value="0552-7211">SALES PROMOTION REPS</option>
                      <option value="0552-7212">SALES PROMOTION NOVELTIES</option>
                      <option value="0552-7214">SALES INCENTIVES</option>
                      <option value="0552-7215">DIRECT MAIL</option>
                      <option value="0552-7216">FLYERS/INSERTS</option>
                      <option value="0552-7217">SPONSORSHIP/TRADE SHOW</option>
                      <option value="0552-7218">RAFFLE EXPENSE</option>
                      <option value="0552-7219">SALES TRAINING</option>
                      <option value="0553-7220">POSTAGE</option>
                      <option value="0553-7221">POSTAGE DUE BUSINESS REPLY</option>
                      <option value="0553-7223">CELL PHONE </option>
                      <option value="0553-7224"> TELEPHONE</option>
                      <option value="0551-7203">OFFICE SUPPLIES</option>
                      <option value="0554-7231">COMMON OFFICE SUPPLIES</option>
                      <option value="0555-7240">FURNITURE AND EQUIP EXPENSE</option>
                      <option value="0555-7241">MAINTENANCE AGREEMENT EXPENSE</option>
                      <option value="0555-7242">EDP EQUIPMENT DEPRECIATION</option>
                      <option value="0555-7243">FURNITURE DEPRECIAITON</option>
                      <option value="0555-7244">SOFTWARE EXPENSE</option>
                      <option value="0561-7300">BOOKS, MAGAZINES</option>
                      <option value="0561-7301">EDUCATION</option>
                      <option value="0566-7350">GENERAL</option>
                      <option value="0566-7357">SALES RECRUITING</option>
                      <option value="0573-7410">ANNUAL CONVENTION EXPENSE</option>
                      <option value="0573-7415">CONVENTION SEMINARS AND MTGS</option>
                      <option value="0573-7416">AFA CONVENTION</option>
                      <option value="0581-7421">GRAPHICS, MISC PRINTING</option>
                      <option value="0583-7430">MISCELLANEOUS DONATIONS</option>
                      <option value="0585-7450">GATHER 4 GOOD </option>
                      <option value="0585-7460">GRANTS 4 GOOD</option>
                      <option value="0585-7510">FRATERNAL EXPENSES</option>
                      <option value="0585-7515">PRIEST GOLF OUTING</option>
                      <option value="0586-7569">DISASTER RELIEF - FOUNDATION</option>
                      <option value="0586-7570">CAA FOUNDATION EXPENSES</option>
                      <option value="0586-7571">CAA FOUNDATION TRUSTEE FEES</option>
                      <option value="0586-7572">CREDIT UNION</option>
                      <option value="0591-7581">HOME OFFICE EXPENSE</option>
                      <option value="0602-8020">LICENSE, FEES</option>

                  </select>
                   </td>
              <td><input class="Expensevendor" data-id="2" id="accode02" type="text"  readonly="readonly" /></td>
              <td><input class="Expensevendor" data-id="2" id="vdamount2" type="text" /></td>
              </tr>
        <tr>
              <td>
                  <select id="vddept03" class="vddept" data-id="3">
                      <option value='0'>Select Departmart/Region</option>
                       <option value='01'>Central</option>
                        <option value='03'>Metro</option>
                        <option value='04'>East</option>
                        <option value='05'>Southwest</option>
                        <option value='06'>Sioux Falls</option>
                        <option value='12'>North</option>
                        <option value='19'>Sales</option>
                        <option value='20'>Marketing</option>
                        <option value='25'>Annuity</option>
                        <option value='30'>Infomation Technology</option>
                        <option value='40'>UnderWriting</option>
                        <option value='50'>Fraternal</option>
                        <option value='55'>Foundation</option>
                        <option value='60'>Member Services</option>
                        <option value='70'>Investments</option>
                        <option value='80'>Administrator</option>
                        <option value='81'>President</option>
                        <option value='82'>Secretary/Treasurer</option>
                        <option value='83'>Human Resources</option>
                        <option value='84'>Claims</option>
                        <option value='85'>Board of Directors</option>
                        <option value='86'>Legal</option>
                        <option value='87'>Compliance</option>
                        <option value='90'>Acounting</option>
                        <option value='95'>Credit Union</option>
                  </select>
              </td>
              <td><input class="Expensevendor" data-id="3" id="code03" type="text"  readonly="readonly" /></td>
               <td>
                <select id="acname03" class="acname" data-id="3">
                      <option value="0">Select Account Description</option>
                      <option value="0551-7200">OFFICER EXPENSE</option>
                      <option value="0551-7201">TRUSTEE EXPENSE</option>
                      <option value="0551-7202">COMMITTEE EXPENSE</option>
                      <option value="0551-7203">OFFICERS AUTO EXPENSE</option>
                      <option value="0551-7204">EMPLOYEES AUTO EXPENSE</option>
                      <option value="0551-7205">AGENCY</option>
                      <option value="0551-7208">SALES CONFERENCES/MEETINGS</option>
                      <option value="0552-7210">ADVERTISING</option>
                      <option value="0552-7211">SALES PROMOTION REPS</option>
                      <option value="0552-7212">SALES PROMOTION NOVELTIES</option>
                      <option value="0552-7214">SALES INCENTIVES</option>
                      <option value="0552-7215">DIRECT MAIL</option>
                      <option value="0552-7216">FLYERS/INSERTS</option>
                      <option value="0552-7217">SPONSORSHIP/TRADE SHOW</option>
                      <option value="0552-7218">RAFFLE EXPENSE</option>
                      <option value="0552-7219">SALES TRAINING</option>
                      <option value="0553-7220">POSTAGE</option>
                      <option value="0553-7221">POSTAGE DUE BUSINESS REPLY</option>
                      <option value="0553-7223">CELL PHONE </option>
                      <option value="0553-7224"> TELEPHONE</option>
                      <option value="0551-7203">OFFICE SUPPLIES</option>
                      <option value="0554-7231">COMMON OFFICE SUPPLIES</option>
                      <option value="0555-7240">FURNITURE AND EQUIP EXPENSE</option>
                      <option value="0555-7241">MAINTENANCE AGREEMENT EXPENSE</option>
                      <option value="0555-7242">EDP EQUIPMENT DEPRECIATION</option>
                      <option value="0555-7243">FURNITURE DEPRECIAITON</option>
                      <option value="0555-7244">SOFTWARE EXPENSE</option>
                      <option value="0561-7300">BOOKS, MAGAZINES</option>
                      <option value="0561-7301">EDUCATION</option>
                      <option value="0566-7350">GENERAL</option>
                      <option value="0566-7357">SALES RECRUITING</option>
                      <option value="0573-7410">ANNUAL CONVENTION EXPENSE</option>
                      <option value="0573-7415">CONVENTION SEMINARS AND MTGS</option>
                      <option value="0573-7416">AFA CONVENTION</option>
                      <option value="0581-7421">GRAPHICS, MISC PRINTING</option>
                      <option value="0583-7430">MISCELLANEOUS DONATIONS</option>
                      <option value="0585-7450">GATHER 4 GOOD </option>
                      <option value="0585-7460">GRANTS 4 GOOD</option>
                      <option value="0585-7510">FRATERNAL EXPENSES</option>
                      <option value="0585-7515">PRIEST GOLF OUTING</option>
                      <option value="0586-7569">DISASTER RELIEF - FOUNDATION</option>
                      <option value="0586-7570">CAA FOUNDATION EXPENSES</option>
                      <option value="0586-7571">CAA FOUNDATION TRUSTEE FEES</option>
                      <option value="0586-7572">CREDIT UNION</option>
                      <option value="0591-7581">HOME OFFICE EXPENSE</option>
                      <option value="0602-8020">LICENSE, FEES</option>
                  </select>
              </td>
              <td><input class="Expensevendor" data-id="3" id="accode03" type="text"  readonly="readonly" /></td>
              <td><input class="Expensevendor" data-id="3" id="vdamount3" type="text" /></td>
              </tr>             
         </tbody>
          </table>
   
       <input type="submit" value="submit" id="submit"/>
        
 
  
</asp:Content>