<%@ Page Title="Log Emergency" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LogEmergency.aspx.cs" Inherits="ReaVaya_Bus_System.Try1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!DOCTYPE html>
<head>
    <style>
          .btnSe{
          background-color:green;
          border-radius:8px;
                    width:180px;
                    height:40px;
          }
          .form1{
          width:50%;
          }

          .register-container {
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    justify-content: center;
                    height: 85vh; /* Adjust height as needed */
                }

      </style>
</head>

    <main>
        <section>
            <div class="container register-container">
                <h1 style="color: aliceblue; font-weight: bold;">Log your emergency here</h1>
                <form class="form1" >
                    <div>
                        <!--<h4 color="white" >emergency tyepe</h4> -->
						<label for="emergency" style="color: aliceblue";>select type of emergency:</label>
                        <select id="emergency" name="emergency">
                          <option value="Accident">Accident</option>
                          <option value="breakdown">Breakdown</option>
                          <option value="other">Other</option>
                        </select>

                    </div>
                    <br />
                    <div>
                        <!--<h4 color="white" >Description</h4>-->
						<input type="text" class="form-control" id="email" placeholder="please describe the issue ">
                    </div>
                    
					<br>
                    <div class="form-group ">
                      <div class="btn-box">
                        <button type="submit" class="btnSe">submit emergency</button>
                      </div>
                    </div>
                </form>
            </div>
        </section>
    </main>
    

</asp:Content>


