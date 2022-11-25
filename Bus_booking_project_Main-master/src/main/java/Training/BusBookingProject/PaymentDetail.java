package Training.BusBookingProject;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name="payment_detail")
public class PaymentDetail {

	@Id
	@Column(name="payment_id")
	private String paymentId;
	
	@Column(name="user_id")
	private String userId;
	
	@Column(name="wallet_id")
	private String walletId;
	
	@Column(name="booking_id")
	private String bookingId;
	
	@Column(name="amount")
	private float amount;

	
	@Enumerated(EnumType.STRING)
	@Column(name="payment_status")
	private PaymentStatus paymentStatus;

	@Enumerated(EnumType.STRING)
	@Column(name="Paytype")
	private PaymentType paytype;
	
	@CreationTimestamp
	@Column(name="paymate_date")
	private Date paydate;

	public Date getPaydate() {
		return paydate;
	}

	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}

	public PaymentType getPaytype() {
		return paytype;
	}

	public void setPaytype(PaymentType paytype) {
		this.paytype = paytype;
	}

	public String getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getWalletId() {
		return walletId;
	}

	public void setWalletId(String walletId) {
		this.walletId = walletId;
	}

	public String getBookingId() {
		return bookingId;
	}

	public void setBookingId(String bookingId) {
		this.bookingId = bookingId;
	}

	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}



	public PaymentStatus getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(PaymentStatus paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	
	
}

