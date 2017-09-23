function getOpener (){
		if(opener){
				return opener.window; 
		}else {
				return parent.window;
		}
}

var baseUrl=$root+'${modPath}${className?lower_case}/';


/*保存*/
function save(){
	if(!validate()){
		return false;
	}
	var vo=$('#saveForm').formToJson();
	$.ajax({
		url : baseUrl+'save.do',
		data : JSON2.stringify(vo),
		dataType: 'json',
		type : 'POST',
		contentType : 'application/json; charset=UTF-8',
        cache: false, 
		success : function(result) {
				alert(result.msg);
			    if(result.ok){
			    	//在父页面定义一个 dialogCancel 函数,参数时一个对象
					if(getOpener()){
						getOpener().pageCallback();
					}
			    	window.close();
			    }
		}
   });
	
}

/*更新*/
function update(){
	if(!validate()){
		return false;
	}
	
	var vo=$('#saveForm').formToJson();
	$.ajax({
		url :  baseUrl+'update.do',
		data : JSON2.stringify(vo),
		dataType: 'json',
		type : 'POST',
		contentType : 'application/json; charset=UTF-8',
        cache: false, 
		success : function(result) {
				alert(result.msg);
			    if(result.ok){
			    	//在父页面定义一个 dialogCancel 函数,参数时一个对象
					if(getOpener()){
						getOpener().pageCallback();
					}
			    	window.close();
			    }
		}
   });
}
/**
 验证函数
**/
function validate(){
  return true;
}

/*跳转到保存*/
function goSave(){
		window.open(baseUrl+'goSave.do','${className?lower_case}_save');
}

/*跳转到修改 */
function goUpdate(id){
		window.open(baseUrl+'goUpdate.do?id='+id,'${className?lower_case}_update');
}
/*跳转到查看 */
function view(id){
		window.open(baseUrl+'view.do?id='+id,'${className?lower_case}_view');
}
	
/*删除*/
function deleteByIds(id){
	var idsArray=[];
	if(id){
		idsArray.push(id);
	}else{
		if ($("input[name='ck_id']:checked").length == 0){
			  alert("请选择一条记录！");
			  return false;
	       }
		else{
		     var objs=$("input[name='ck_id']:checked").val([]);
		     objs.each(function (){
		    	 idsArray.push(this.value);
		     });
		}
		
	}
	if(idsArray.length>0){
		if(confirm("确定删除吗?")){
			$.ajax({
				url : baseUrl+'deleteByIds.do',
				data : {ids:idsArray},
				type : 'POST',
				success : function(result) {
					alert(result.msg);
				    if(result.ok){
					  pageCallback();
				    }
				}
			});
		}
	}
}

/*全选*/
function check(who) {
		if ('all' == who.value) {
			$("input[name='ck_id']").each(function() {
				this.checked = who.checked;
			});
		} else {
			var checkAll = true;
			$("input[name='ck_id']").each(function() {
				if (!this.checked) {
					checkAll = false;
				}
				return checkAll;
			});
			$('#check_all')[0].checked = checkAll;
		}
}
 /*分页查询*/
function pageCallback(page) {
		var url = baseUrl+'list.do?1=1';
		__pageCallback(page,url)
}
/*内部使用的通用函数 */
function __pageCallback(page,url) {
		if (page) {
			url = url + '&pagesize=' + page.pageSize + '&currentPage='+ page.currentPage
		}
		document.getElementById("searchForm").action = url;
		ajaxAnywhere.formName = "searchForm";
		ajaxAnywhere.submitAJAX();
}

/*指定刷新区域*/
ajaxAnywhere.getZonesToReload = function() {
		return "listZone";
};
