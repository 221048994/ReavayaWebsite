﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ReaVaya_Bus_System
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="ReaVaya Database")]
	public partial class DataClasses1DataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InsertUser(User instance);
    partial void UpdateUser(User instance);
    partial void DeleteUser(User instance);
    partial void InsertTransaction(Transaction instance);
    partial void UpdateTransaction(Transaction instance);
    partial void DeleteTransaction(Transaction instance);
    partial void InsertTicket(Ticket instance);
    partial void UpdateTicket(Ticket instance);
    partial void DeleteTicket(Ticket instance);
    partial void InsertSchedulee(Schedulee instance);
    partial void UpdateSchedulee(Schedulee instance);
    partial void DeleteSchedulee(Schedulee instance);
    #endregion
		
		public DataClasses1DataContext() : 
				base(global::System.Configuration.ConfigurationManager.ConnectionStrings["ReaVaya_DatabaseConnectionString"].ConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public DataClasses1DataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DataClasses1DataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DataClasses1DataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DataClasses1DataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<User> Users
		{
			get
			{
				return this.GetTable<User>();
			}
		}
		
		public System.Data.Linq.Table<Transaction> Transactions
		{
			get
			{
				return this.GetTable<Transaction>();
			}
		}
		
		public System.Data.Linq.Table<Ticket> Tickets
		{
			get
			{
				return this.GetTable<Ticket>();
			}
		}
		
		public System.Data.Linq.Table<Schedulee> Schedulees
		{
			get
			{
				return this.GetTable<Schedulee>();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.[User]")]
	public partial class User : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private string _Email;
		
		private string _Name;
		
		private string _Surname;
		
		private string _ContactInfo;
		
		private string _Password;
		
		private int _UserType;
		
		private string _LicenseNumber;
		
		private EntitySet<Transaction> _Transactions;
		
		private EntitySet<Ticket> _Tickets;
		
		private EntitySet<Schedulee> _Schedulees;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnEmailChanging(string value);
    partial void OnEmailChanged();
    partial void OnNameChanging(string value);
    partial void OnNameChanged();
    partial void OnSurnameChanging(string value);
    partial void OnSurnameChanged();
    partial void OnContactInfoChanging(string value);
    partial void OnContactInfoChanged();
    partial void OnPasswordChanging(string value);
    partial void OnPasswordChanged();
    partial void OnUserTypeChanging(int value);
    partial void OnUserTypeChanged();
    partial void OnLicenseNumberChanging(string value);
    partial void OnLicenseNumberChanged();
    #endregion
		
		public User()
		{
			this._Transactions = new EntitySet<Transaction>(new Action<Transaction>(this.attach_Transactions), new Action<Transaction>(this.detach_Transactions));
			this._Tickets = new EntitySet<Ticket>(new Action<Ticket>(this.attach_Tickets), new Action<Ticket>(this.detach_Tickets));
			this._Schedulees = new EntitySet<Schedulee>(new Action<Schedulee>(this.attach_Schedulees), new Action<Schedulee>(this.detach_Schedulees));
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Email", DbType="VarChar(50) NOT NULL", CanBeNull=false, IsPrimaryKey=true)]
		public string Email
		{
			get
			{
				return this._Email;
			}
			set
			{
				if ((this._Email != value))
				{
					this.OnEmailChanging(value);
					this.SendPropertyChanging();
					this._Email = value;
					this.SendPropertyChanged("Email");
					this.OnEmailChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Name", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string Name
		{
			get
			{
				return this._Name;
			}
			set
			{
				if ((this._Name != value))
				{
					this.OnNameChanging(value);
					this.SendPropertyChanging();
					this._Name = value;
					this.SendPropertyChanged("Name");
					this.OnNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Surname", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string Surname
		{
			get
			{
				return this._Surname;
			}
			set
			{
				if ((this._Surname != value))
				{
					this.OnSurnameChanging(value);
					this.SendPropertyChanging();
					this._Surname = value;
					this.SendPropertyChanged("Surname");
					this.OnSurnameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ContactInfo", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string ContactInfo
		{
			get
			{
				return this._ContactInfo;
			}
			set
			{
				if ((this._ContactInfo != value))
				{
					this.OnContactInfoChanging(value);
					this.SendPropertyChanging();
					this._ContactInfo = value;
					this.SendPropertyChanged("ContactInfo");
					this.OnContactInfoChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Password", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string Password
		{
			get
			{
				return this._Password;
			}
			set
			{
				if ((this._Password != value))
				{
					this.OnPasswordChanging(value);
					this.SendPropertyChanging();
					this._Password = value;
					this.SendPropertyChanged("Password");
					this.OnPasswordChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_UserType", DbType="Int NOT NULL")]
		public int UserType
		{
			get
			{
				return this._UserType;
			}
			set
			{
				if ((this._UserType != value))
				{
					this.OnUserTypeChanging(value);
					this.SendPropertyChanging();
					this._UserType = value;
					this.SendPropertyChanged("UserType");
					this.OnUserTypeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_LicenseNumber", DbType="VarChar(50)")]
		public string LicenseNumber
		{
			get
			{
				return this._LicenseNumber;
			}
			set
			{
				if ((this._LicenseNumber != value))
				{
					this.OnLicenseNumberChanging(value);
					this.SendPropertyChanging();
					this._LicenseNumber = value;
					this.SendPropertyChanged("LicenseNumber");
					this.OnLicenseNumberChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="User_Transaction", Storage="_Transactions", ThisKey="Email", OtherKey="Email")]
		public EntitySet<Transaction> Transactions
		{
			get
			{
				return this._Transactions;
			}
			set
			{
				this._Transactions.Assign(value);
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="User_Ticket", Storage="_Tickets", ThisKey="Email", OtherKey="Email")]
		public EntitySet<Ticket> Tickets
		{
			get
			{
				return this._Tickets;
			}
			set
			{
				this._Tickets.Assign(value);
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="User_Schedulee", Storage="_Schedulees", ThisKey="Email", OtherKey="DriverEmail")]
		public EntitySet<Schedulee> Schedulees
		{
			get
			{
				return this._Schedulees;
			}
			set
			{
				this._Schedulees.Assign(value);
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_Transactions(Transaction entity)
		{
			this.SendPropertyChanging();
			entity.User = this;
		}
		
		private void detach_Transactions(Transaction entity)
		{
			this.SendPropertyChanging();
			entity.User = null;
		}
		
		private void attach_Tickets(Ticket entity)
		{
			this.SendPropertyChanging();
			entity.User = this;
		}
		
		private void detach_Tickets(Ticket entity)
		{
			this.SendPropertyChanging();
			entity.User = null;
		}
		
		private void attach_Schedulees(Schedulee entity)
		{
			this.SendPropertyChanging();
			entity.User = this;
		}
		
		private void detach_Schedulees(Schedulee entity)
		{
			this.SendPropertyChanging();
			entity.User = null;
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Transactions")]
	public partial class Transaction : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _TransactionID;
		
		private int _TicketID;
		
		private string _Email;
		
		private string _Amount;
		
		private System.DateTime _TransactionDate;
		
		private string _CardNumber;
		
		private string _ExpiryDate;
		
		private string _Cvv;
		
		private EntityRef<User> _User;
		
		private EntityRef<Ticket> _Ticket;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnTransactionIDChanging(int value);
    partial void OnTransactionIDChanged();
    partial void OnTicketIDChanging(int value);
    partial void OnTicketIDChanged();
    partial void OnEmailChanging(string value);
    partial void OnEmailChanged();
    partial void OnAmountChanging(string value);
    partial void OnAmountChanged();
    partial void OnTransactionDateChanging(System.DateTime value);
    partial void OnTransactionDateChanged();
    partial void OnCardNumberChanging(string value);
    partial void OnCardNumberChanged();
    partial void OnExpiryDateChanging(string value);
    partial void OnExpiryDateChanged();
    partial void OnCvvChanging(string value);
    partial void OnCvvChanged();
    #endregion
		
		public Transaction()
		{
			this._User = default(EntityRef<User>);
			this._Ticket = default(EntityRef<Ticket>);
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TransactionID", DbType="Int NOT NULL", IsPrimaryKey=true)]
		public int TransactionID
		{
			get
			{
				return this._TransactionID;
			}
			set
			{
				if ((this._TransactionID != value))
				{
					this.OnTransactionIDChanging(value);
					this.SendPropertyChanging();
					this._TransactionID = value;
					this.SendPropertyChanged("TransactionID");
					this.OnTransactionIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TicketID", DbType="Int NOT NULL")]
		public int TicketID
		{
			get
			{
				return this._TicketID;
			}
			set
			{
				if ((this._TicketID != value))
				{
					if (this._Ticket.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnTicketIDChanging(value);
					this.SendPropertyChanging();
					this._TicketID = value;
					this.SendPropertyChanged("TicketID");
					this.OnTicketIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Email", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string Email
		{
			get
			{
				return this._Email;
			}
			set
			{
				if ((this._Email != value))
				{
					if (this._User.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnEmailChanging(value);
					this.SendPropertyChanging();
					this._Email = value;
					this.SendPropertyChanged("Email");
					this.OnEmailChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Amount", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string Amount
		{
			get
			{
				return this._Amount;
			}
			set
			{
				if ((this._Amount != value))
				{
					this.OnAmountChanging(value);
					this.SendPropertyChanging();
					this._Amount = value;
					this.SendPropertyChanged("Amount");
					this.OnAmountChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TransactionDate", DbType="Date NOT NULL")]
		public System.DateTime TransactionDate
		{
			get
			{
				return this._TransactionDate;
			}
			set
			{
				if ((this._TransactionDate != value))
				{
					this.OnTransactionDateChanging(value);
					this.SendPropertyChanging();
					this._TransactionDate = value;
					this.SendPropertyChanged("TransactionDate");
					this.OnTransactionDateChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_CardNumber", DbType="VarChar(16) NOT NULL", CanBeNull=false)]
		public string CardNumber
		{
			get
			{
				return this._CardNumber;
			}
			set
			{
				if ((this._CardNumber != value))
				{
					this.OnCardNumberChanging(value);
					this.SendPropertyChanging();
					this._CardNumber = value;
					this.SendPropertyChanged("CardNumber");
					this.OnCardNumberChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ExpiryDate", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string ExpiryDate
		{
			get
			{
				return this._ExpiryDate;
			}
			set
			{
				if ((this._ExpiryDate != value))
				{
					this.OnExpiryDateChanging(value);
					this.SendPropertyChanging();
					this._ExpiryDate = value;
					this.SendPropertyChanged("ExpiryDate");
					this.OnExpiryDateChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Cvv", DbType="VarChar(3) NOT NULL", CanBeNull=false)]
		public string Cvv
		{
			get
			{
				return this._Cvv;
			}
			set
			{
				if ((this._Cvv != value))
				{
					this.OnCvvChanging(value);
					this.SendPropertyChanging();
					this._Cvv = value;
					this.SendPropertyChanged("Cvv");
					this.OnCvvChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="User_Transaction", Storage="_User", ThisKey="Email", OtherKey="Email", IsForeignKey=true)]
		public User User
		{
			get
			{
				return this._User.Entity;
			}
			set
			{
				User previousValue = this._User.Entity;
				if (((previousValue != value) 
							|| (this._User.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._User.Entity = null;
						previousValue.Transactions.Remove(this);
					}
					this._User.Entity = value;
					if ((value != null))
					{
						value.Transactions.Add(this);
						this._Email = value.Email;
					}
					else
					{
						this._Email = default(string);
					}
					this.SendPropertyChanged("User");
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Ticket_Transaction", Storage="_Ticket", ThisKey="TicketID", OtherKey="TicketID", IsForeignKey=true)]
		public Ticket Ticket
		{
			get
			{
				return this._Ticket.Entity;
			}
			set
			{
				Ticket previousValue = this._Ticket.Entity;
				if (((previousValue != value) 
							|| (this._Ticket.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Ticket.Entity = null;
						previousValue.Transactions.Remove(this);
					}
					this._Ticket.Entity = value;
					if ((value != null))
					{
						value.Transactions.Add(this);
						this._TicketID = value.TicketID;
					}
					else
					{
						this._TicketID = default(int);
					}
					this.SendPropertyChanged("Ticket");
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Tickets")]
	public partial class Ticket : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _TicketID;
		
		private string _Origin;
		
		private string _Destination;
		
		private string _Quantity;
		
		private System.DateTime _PurchaseDate;
		
		private string _Email;
		
		private EntitySet<Transaction> _Transactions;
		
		private EntityRef<User> _User;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnTicketIDChanging(int value);
    partial void OnTicketIDChanged();
    partial void OnOriginChanging(string value);
    partial void OnOriginChanged();
    partial void OnDestinationChanging(string value);
    partial void OnDestinationChanged();
    partial void OnQuantityChanging(string value);
    partial void OnQuantityChanged();
    partial void OnPurchaseDateChanging(System.DateTime value);
    partial void OnPurchaseDateChanged();
    partial void OnEmailChanging(string value);
    partial void OnEmailChanged();
    #endregion
		
		public Ticket()
		{
			this._Transactions = new EntitySet<Transaction>(new Action<Transaction>(this.attach_Transactions), new Action<Transaction>(this.detach_Transactions));
			this._User = default(EntityRef<User>);
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TicketID", DbType="Int NOT NULL", IsPrimaryKey=true)]
		public int TicketID
		{
			get
			{
				return this._TicketID;
			}
			set
			{
				if ((this._TicketID != value))
				{
					this.OnTicketIDChanging(value);
					this.SendPropertyChanging();
					this._TicketID = value;
					this.SendPropertyChanged("TicketID");
					this.OnTicketIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Origin", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string Origin
		{
			get
			{
				return this._Origin;
			}
			set
			{
				if ((this._Origin != value))
				{
					this.OnOriginChanging(value);
					this.SendPropertyChanging();
					this._Origin = value;
					this.SendPropertyChanged("Origin");
					this.OnOriginChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Destination", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string Destination
		{
			get
			{
				return this._Destination;
			}
			set
			{
				if ((this._Destination != value))
				{
					this.OnDestinationChanging(value);
					this.SendPropertyChanging();
					this._Destination = value;
					this.SendPropertyChanged("Destination");
					this.OnDestinationChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Quantity", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string Quantity
		{
			get
			{
				return this._Quantity;
			}
			set
			{
				if ((this._Quantity != value))
				{
					this.OnQuantityChanging(value);
					this.SendPropertyChanging();
					this._Quantity = value;
					this.SendPropertyChanged("Quantity");
					this.OnQuantityChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_PurchaseDate", DbType="Date NOT NULL")]
		public System.DateTime PurchaseDate
		{
			get
			{
				return this._PurchaseDate;
			}
			set
			{
				if ((this._PurchaseDate != value))
				{
					this.OnPurchaseDateChanging(value);
					this.SendPropertyChanging();
					this._PurchaseDate = value;
					this.SendPropertyChanged("PurchaseDate");
					this.OnPurchaseDateChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Email", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string Email
		{
			get
			{
				return this._Email;
			}
			set
			{
				if ((this._Email != value))
				{
					if (this._User.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnEmailChanging(value);
					this.SendPropertyChanging();
					this._Email = value;
					this.SendPropertyChanged("Email");
					this.OnEmailChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Ticket_Transaction", Storage="_Transactions", ThisKey="TicketID", OtherKey="TicketID")]
		public EntitySet<Transaction> Transactions
		{
			get
			{
				return this._Transactions;
			}
			set
			{
				this._Transactions.Assign(value);
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="User_Ticket", Storage="_User", ThisKey="Email", OtherKey="Email", IsForeignKey=true)]
		public User User
		{
			get
			{
				return this._User.Entity;
			}
			set
			{
				User previousValue = this._User.Entity;
				if (((previousValue != value) 
							|| (this._User.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._User.Entity = null;
						previousValue.Tickets.Remove(this);
					}
					this._User.Entity = value;
					if ((value != null))
					{
						value.Tickets.Add(this);
						this._Email = value.Email;
					}
					else
					{
						this._Email = default(string);
					}
					this.SendPropertyChanged("User");
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_Transactions(Transaction entity)
		{
			this.SendPropertyChanging();
			entity.Ticket = this;
		}
		
		private void detach_Transactions(Transaction entity)
		{
			this.SendPropertyChanging();
			entity.Ticket = null;
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Schedulee")]
	public partial class Schedulee : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _ScheduleID;
		
		private string _DriverEmail;
		
		private string _Route_No;
		
		private int _BusID;
		
		private System.DateTime _StartDate;
		
		private System.DateTime _EndDate;
		
		private string _Tier;
		
		private EntityRef<User> _User;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnScheduleIDChanging(int value);
    partial void OnScheduleIDChanged();
    partial void OnDriverEmailChanging(string value);
    partial void OnDriverEmailChanged();
    partial void OnRoute_NoChanging(string value);
    partial void OnRoute_NoChanged();
    partial void OnBusIDChanging(int value);
    partial void OnBusIDChanged();
    partial void OnStartDateChanging(System.DateTime value);
    partial void OnStartDateChanged();
    partial void OnEndDateChanging(System.DateTime value);
    partial void OnEndDateChanged();
    partial void OnTierChanging(string value);
    partial void OnTierChanged();
    #endregion
		
		public Schedulee()
		{
			this._User = default(EntityRef<User>);
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ScheduleID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int ScheduleID
		{
			get
			{
				return this._ScheduleID;
			}
			set
			{
				if ((this._ScheduleID != value))
				{
					this.OnScheduleIDChanging(value);
					this.SendPropertyChanging();
					this._ScheduleID = value;
					this.SendPropertyChanged("ScheduleID");
					this.OnScheduleIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DriverEmail", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string DriverEmail
		{
			get
			{
				return this._DriverEmail;
			}
			set
			{
				if ((this._DriverEmail != value))
				{
					if (this._User.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnDriverEmailChanging(value);
					this.SendPropertyChanging();
					this._DriverEmail = value;
					this.SendPropertyChanged("DriverEmail");
					this.OnDriverEmailChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Route_No", DbType="VarChar(10) NOT NULL", CanBeNull=false)]
		public string Route_No
		{
			get
			{
				return this._Route_No;
			}
			set
			{
				if ((this._Route_No != value))
				{
					this.OnRoute_NoChanging(value);
					this.SendPropertyChanging();
					this._Route_No = value;
					this.SendPropertyChanged("Route_No");
					this.OnRoute_NoChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_BusID", DbType="Int NOT NULL")]
		public int BusID
		{
			get
			{
				return this._BusID;
			}
			set
			{
				if ((this._BusID != value))
				{
					this.OnBusIDChanging(value);
					this.SendPropertyChanging();
					this._BusID = value;
					this.SendPropertyChanged("BusID");
					this.OnBusIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_StartDate", DbType="Date NOT NULL")]
		public System.DateTime StartDate
		{
			get
			{
				return this._StartDate;
			}
			set
			{
				if ((this._StartDate != value))
				{
					this.OnStartDateChanging(value);
					this.SendPropertyChanging();
					this._StartDate = value;
					this.SendPropertyChanged("StartDate");
					this.OnStartDateChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_EndDate", DbType="Date NOT NULL")]
		public System.DateTime EndDate
		{
			get
			{
				return this._EndDate;
			}
			set
			{
				if ((this._EndDate != value))
				{
					this.OnEndDateChanging(value);
					this.SendPropertyChanging();
					this._EndDate = value;
					this.SendPropertyChanged("EndDate");
					this.OnEndDateChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Tier", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string Tier
		{
			get
			{
				return this._Tier;
			}
			set
			{
				if ((this._Tier != value))
				{
					this.OnTierChanging(value);
					this.SendPropertyChanging();
					this._Tier = value;
					this.SendPropertyChanged("Tier");
					this.OnTierChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="User_Schedulee", Storage="_User", ThisKey="DriverEmail", OtherKey="Email", IsForeignKey=true)]
		public User User
		{
			get
			{
				return this._User.Entity;
			}
			set
			{
				User previousValue = this._User.Entity;
				if (((previousValue != value) 
							|| (this._User.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._User.Entity = null;
						previousValue.Schedulees.Remove(this);
					}
					this._User.Entity = value;
					if ((value != null))
					{
						value.Schedulees.Add(this);
						this._DriverEmail = value.Email;
					}
					else
					{
						this._DriverEmail = default(string);
					}
					this.SendPropertyChanged("User");
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
}
#pragma warning restore 1591
