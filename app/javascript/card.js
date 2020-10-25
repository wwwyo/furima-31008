const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const firstForm = document.getElementById("charge-form");
  firstForm.addEventListener("submit", (e)=> {
    e.preventDefault();

    const form = document.getElementById("charge-form");
    const formData = new FormData(form);

    const card = {
      number: formData.get("order_form[number]"),
      exp_month: formData.get("order_form[exp_month]"),
      exp_year: `20${formData.get("order_form[exp_year]")}`,
      cvc: formData.get("order_form[cvc]"),
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const tokenObj = `<input value=${token} name='token', type='hidden'>`;
        form.insertAdjacentHTML('beforeend', tokenObj);
      }
    
      document.getElementById("card-number").removeAttribute("order_form[number]");
      document.getElementById("card-exp-month").removeAttribute("order_form[exp_month]");
      document.getElementById("card-exp-year").removeAttribute("order_form[exp_year]");
      document.getElementById("card-cvc").removeAttribute("order_form[cvc]");
      
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);