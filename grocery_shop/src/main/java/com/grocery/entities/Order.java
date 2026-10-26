package com.grocery.entities;

public class Order {
	 private int id;
	    private int userId;
	    private double totalAmount;
	    
	    
	    
	    
		public Order(int id, int userId, double totalAmount) {
			super();
			this.id = id;
			this.userId = userId;
			this.totalAmount = totalAmount;
		}




		public Order() {
			super();
		}




		public Order(int userId, double totalAmount) {
			super();
			this.userId = userId;
			this.totalAmount = totalAmount;
		}




		public int getId() {
			return id;
		}




		public void setId(int id) {
			this.id = id;
		}




		public int getUserId() {
			return userId;
		}




		public void setUserId(int userId) {
			this.userId = userId;
		}




		public double getTotalAmount() {
			return totalAmount;
		}




		public void setTotalAmount(double totalAmount) {
			this.totalAmount = totalAmount;
		}
	    
	    
	    
	    
	    

}
