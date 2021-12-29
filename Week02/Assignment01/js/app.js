
function Book(bookid,bookName,authorName){
    this.bookid=bookid;
    this.bookName=bookName;
    this.authorName=authorName;
    this.displayBookDetails=function (){
    return "Book Id :"+this.bookid + "<br>" + " Book Name :"+this.bookName + " <br> "+ " Author Name:"+this.authorName;
    }
    }

    const book1=new Book("001","tHe LaSt DaY","XYZ");
    const result=document.getElementById("result");
    result.innerHTML=book1.displayBookDetails();