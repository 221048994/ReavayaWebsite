<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Notice.aspx.cs" Inherits="ReaVaya_Bus_System.Notice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
    .header {
      color: #fff;
      padding: 20px 0;
      text-align: center;
      margin-bottom: 20px;
    }

    .container2 {
      max-width: 800px;
      margin: 0 auto;
      padding: 20px;
      background-color: lightgray;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h1 {
      text-align: center;
      margin-bottom: 20px;
    }

    .notice {
      border: 1px solid #ccc;
      border-radius: 5px;
      padding: 20px;
      margin-bottom: 20px;
      background-color: #f9f9f9;
    }

    .notice h2 {
      margin-top: 0;
    }

    .notice p {
      margin-bottom: 0;
    }

    .notice.date {
      font-size: 14px;
      color: #888;
      text-align: right;
    }

    button {
      padding: 10px 20px;
      background-color: #007bff;
      color: #fff;
      border: none;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
    }

    button:hover {
      background-color: #0056b3;
    }

    .message {
      text-align: center;
      margin-top: 20px;
      font-size: 18px;
    }
  </style>

    <!-- notices section -->
  <main>
    <div class="container2">
      <h1>Notices</h1>
      <div id="noticesContainer">
        <!-- Notices will be dynamically inserted here -->
      </div>
    </div>
  </main>

  <script>
    // Sample notices
    const notices = [
      { title: "Delay Due to Traffic", description: "Due to heavy traffic, all buses will experience delays of up to 30 minutes.", date: "2024-07-28" },
      { title: "Accident on Route 5", description: "An accident occurred on Route 5. Expect significant delays until further notice.", date: "2024-07-27" },
      { title: "Service Alert", description: "Scheduled maintenance for all services on July 30th from 2 AM to 4 AM.", date: "2024-07-26" },
    ];

    const noticesContainer = document.getElementById('noticesContainer');

    notices.forEach(notice => {
      const noticeElement = document.createElement('div');
      noticeElement.classList.add('notice');
      noticeElement.innerHTML = `
        <h2>${notice.title}</h2>
        <p>${notice.description}</p>
        <p class="date">${notice.date}</p>
      `;
      noticesContainer.appendChild(noticeElement);
    });
  </script>

</asp:Content>
