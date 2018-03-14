class PaymentsController < ApplicationController
  before_action :set_ticket

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @ticket.price_cents,
      description:  "Payment for ticket #{@ticket.sku} for ticket #{@ticket.id}",
      currency:     @ticket.price.currency
    )

    @ticket.update(payment: charge.to_json, state: 'paid', paid_at: Time.new)
    redirect_to ticket_path(@ticket)

    rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to ticket_path(@ticket)
  end

private

  def set_ticket
    @ticket = Ticket.where(state: 'pending').find(params[:ticket_id])
  end
end
