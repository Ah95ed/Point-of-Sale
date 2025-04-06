class Items {
 late String id, name, code, sale, buy, quantity,company, date, time;

  
  Items(
     this.name,
     this.code,
     this.sale,
     this.buy,
     this.quantity,
     this.id,
     this.company,
     this.date,
     this.time
  );
  Items.FromAccount(String name,String sale ,String quantity) {
    this.name = name;
    this.sale = sale;
    this.quantity = quantity;
  }
  
}
