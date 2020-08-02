const openButton = document.getElementById('stripe-open')
if (openButton) {
  openButton.onclick = () => {
    document.getElementById('stripe-modal').classList.remove('stripe-modal-hidden')
  }
}

const headerLink = document.getElementById('stripe-open-header')
if (headerLink) {
  headerLink.onclick = () => {
    document.getElementById('stripe-modal').classList.remove('stripe-modal-hidden')
  }
}

// this doesn't work : (
const bookLink = document.getElementById('stripe-books-index')
if (bookLink) {
  bookLink.onclick = () => {
    document.getElementById('stripe-modal').classList.remove('stripe-modal-hidden')
  }
}

document.getElementById('close-stripe-modal').onclick = () => {
  document.getElementById('stripe-modal').classList.add('stripe-modal-hidden')
}


const stripeCustomerId = document.getElementById('stripe-customer-id').value
const stripePriceId = document.getElementById('stripe-price-id').value
const subscriptionForm =
  document.getElementById('new_stripe_customer_subscription')
const paymentMethodIdInput =
  document.getElementById('stripe_customer_subscription_payment_method_id')

// const fontSize = window.innerWidth > 500 ? "16px" : "16px"
const os = getOS()
let fontSize = '16px';
if (os === 'iOS' || os === 'Android') {
  fontSize = '36px';
}
// Set up Stripe.js and Elements to use in checkout form
var style = {
  base: {
    color: "#32325d",
    fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
    fontSmoothing: "antialiased",
    fontSize,
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
  document.getElementById('stripe-form-submit-button').classList.add('disabled')

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
        displayError(error);
      } else {
        paymentMethodIdInput.value = result.paymentMethod.id
        subscriptionForm.submit()
      }
    });
}

function getOS() {
  var userAgent = window.navigator.userAgent,
      platform = window.navigator.platform,
      macosPlatforms = ['Macintosh', 'MacIntel', 'MacPPC', 'Mac68K'],
      windowsPlatforms = ['Win32', 'Win64', 'Windows', 'WinCE'],
      iosPlatforms = ['iPhone', 'iPod'],
      os = null;

  if (macosPlatforms.indexOf(platform) !== -1) {
    os = 'Mac OS';
  } else if (iosPlatforms.indexOf(platform) !== -1) {
    os = 'iOS';
  } else if (windowsPlatforms.indexOf(platform) !== -1) {
    os = 'Windows';
  } else if (/Android/.test(userAgent)) {
    os = 'Android';
  } else if (!os && /Linux/.test(platform)) {
    os = 'Linux';
  }

  return os;
}
