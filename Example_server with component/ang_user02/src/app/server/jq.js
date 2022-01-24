
$(function(){
    $("#add_User").on("click",function(){
        
        $.get("employee1",function(data,status){
            console.log(data[0].id)
              
                alert(JSON.stringify(data))
        });
    });
    $("#update_contact").on("click",function(){
        alert("update called ");
       
        const id=$("#id").val();
        const firstName=$("#firstName").val();
        alert("id "+id);
        $.ajax({
            url:"update_contact/"+id,
            content:{"id":id,"firstName":firstName},
            type:"PUT",            
            success:function(result){
                $("#result").text(JSON.stringify(result));
            },
            error:function(result){
                $("#error").css("color","#ff0000");
                $("#error").text(JSON.stringify(result));                
            }
        })
    });
    $("#delete_contact").on("click",function(){
        alert("Delete Called !")
        $.ajax({
            url:"delete_contact/"+$("#id").val(),
            type:"DELETE",
            success:function(data){
                alert(JSON.stringify(data))
            },
            error:function(err){
                alert(JSON.stringify(err))
            }
        });

    });
});

