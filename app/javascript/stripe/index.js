// need to hide this module when on pages that don't display the payment form
console.log('hello from the stripe script')

const stripeCustomerId = document.getElementById('stripe-customer-id').value
const stripePriceId = document.getElementById('stripe-price-id').value
const subscriptionForm =
  document.getElementById('new_stripe_customer_subscription')
const paymentMethodIdInput =
  document.getElementById('stripe_customer_subscription_payment_method_id')

// Set up Stripe.js and Elements to use in checkout form
var style = {
  base: {
    color: "#32325d",
    fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
    fontSmoothing: "antialiased",
    fontSize: "16px",
    "::placeholder": {
      color: "#aab7c4"
    }
  },
  invalid: {
    color: "#fa755a",
    iconColor: "#fa755a"
  }
};

var cardElement = window.elements.create("card", { style: style });
cardElement.mount("#card-element");

cardElement.on('change', showCardError);

function showCardError(event) {
  let displayError = document.getElementById('card-errors');
  if (event.error) {
    displayError.textContent = event.error.message;
  } else {
    displayError.textContent = '';
  }
}

// #subscription-form
var form = document.getElementById('subscription-form')
form.addEventListener('submit', event => {
  event.preventDefault()
  console.log('Card submitted')

  return createPaymentMethod(cardElement, stripeCustomerId, stripePriceId)
})

function createPaymentMethod(cardElement) {
  return stripe
    .createPaymentMethod({
      type: 'card',
      card: cardElement,
    })
    .then((result) => {
      if (result.error) {
        // todo: implement
        displayError(error);
      } else {
        // fill payment method id into form and submit it?
        paymentMethodIdInput.value = result.paymentMethod.id
        subscriptionForm.submit()
        // https://stripe.com/docs/billing/subscriptions/fixed-price?lang=javascript#create-subscription
      }
    });
}
