$(".new-btn").on("click", function(){
  $(".task_name").val("");
  $(".task_description").val("");
  $(".task_category").val("");
});

$(".info-btn").on("click", function(){
  $ul = $(this).closest("ul");
  var data = $ul.children("li").map(function(){
    return $(this).text();
  })
  $(".task_name").html(data[0]);
  if (data[1] === ""){
    $(".task_description").html("No Task Description.");
  }else{
    $(".task_description").html(data[1]);
  }
  $(".task_category").html("Category: " + data[2]);
})

$(".edit-btn").on("click", function(){
  $ul = $(this).closest("ul");
  var data = $ul.children("li").map(function(){
    return $(this).text();
  })
  $("input#task_task_name").val(data[0]);
  $("input#task_task_description").val("No Task Description.");
  $("input#task_task_description").val(data[1]);
  $("input#task_category").val(data[2]);
  $("select#task_task_due_3i").val(data[3]);
  $("select#task_task_due_2i").val(data[4]);
  $("select#task_task_due_1i").val(data[5]);

})
