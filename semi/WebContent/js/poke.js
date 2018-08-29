var lastNum = 0;
function submit() {
	var id = '${id}';
	var content = $('#contents').val();
	$.ajax({
		type: "post",
		url: "/semi/poke/chatInsert.do",
		data: {
			id: id,
			content: content
		},
		success: function(result) {
			if(result == 1){
				$('#contents').val('');
			}else if(result == 0){
				alert('내용을 정확히 입력하세요');
			}else{
				alert('데이터베이스 오류가 발생했습니다.');
			}
		} 
	});
	
}
	
function chatList(type) {
	$.ajax({
		type: "post",
		url: "/semi/poke/chatList.do",
		data: {
			listType: type,
		},
		success: function(data) {
			if(data == "") return;
			var parsed = JSON.parse(data);
			var result = parsed.result;
			for(var i = 0; i<result.length;i++){
				addChat(result[i][0].value, result[i][1].value,result[i][2].value);
			}
			lastNum = Number(parsed.last);
		}
	});
}

function addChat(id,content,regdate) {
	$('#chatList').append('<img src="img/1.png" style="width: 30px">'+ ' ' + id + '<br>' + content + ' ' + regdate + "<hr> <br>" );
	
	
	$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
}
		
function getInfiniteChat() {
	setInterval(function() {
		chatList(lastNum)
	}, 1000);
}		