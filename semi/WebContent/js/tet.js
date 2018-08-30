window.pp = {};
window.pp.tet = {};


pp.tet.init = function(id){// 초기화
	pp.tet.id = id;
	pp.tet.canvas = document.getElementById("canvas");
	pp.tet.ctx = pp.tet.canvas.getContext("2d");
	
	pp.tet.background = "gray";
	
	pp.tet.cell = 40; // 한 칸 크기
	pp.tet.bx = pp.tet.canvas.width / pp.tet.cell; // x길이
	pp.tet.by = pp.tet.canvas.height / pp.tet.cell;// y길이
	
	pp.tet.x = Math.floor(pp.tet.bx / 2); // x좌표
	pp.tet.y = 2; // y좌표
	
	
	// block 초기화
	pp.tet.block = [];
	pp.tet.block.push([{x:0, y:0, c:"black"}, {x:0, y:1, c:"blue"}, {x:0, y:-1, c:"blue"}, {x:-1, y:-1, c:"blue"}]);
	pp.tet.block.push([{x:0, y:0, c:"black"}, {x:0, y:-1, c:"red"}, {x:-1, y:0, c:"red"}, {x:1, y:0, c:"red"}]);
	pp.tet.block.push([{x:0, y:0, c:"black"}, {x:1, y:0, c:"lime"}, {x:1, y:1, c:"lime"}, {x:0, y:1, c:"lime"}]);
	pp.tet.block.push([{x:0, y:0, c:"black"}, {x:0, y:-1, c:"pink"},{x:1, y:-1, c:"pink"},{x:2, y:-1, c:"pink"},{x:0, y:1, c:"pink"},{x:1, y:1, c:"pink"},{x:2, y:1, c:"pink"}]);
	pp.tet.block.push([{x:0, y:0, c:"black"}, {x:0, y:-1, c:"powderblue"}, {x:-1, y:0, c:"powderblue"}, {x:1, y:0, c:"powderblue"}, {x:0, y:-2, c:"powderblue"}]);
	pp.tet.block.push([{x:0, y:0, c:"black"}, {x:-1, y:0, c:"tomato"}, {x:1, y:0, c:"tomato"}, {x:2, y:0, c:"tomato"}]);
	pp.tet.present_block = Math.floor(Math.random() * pp.tet.block.length);
	
	// 구해오는 함수 다음블록
	pp.tet.next_block = Math.floor(Math.random() * pp.tet.block.length);
	
	pp.tet.stack = new Array();
	
	for(var i=0;i<pp.tet.by;i++){ // 보드 배열 초기화
		if(!Array.isArray(pp.tet.stack[i])){
			pp.tet.stack[i] = new Array();
		}
		for(var j=0;j<pp.tet.bx;j++){
			pp.tet.stack[i][j] = {is:0, colour:"gray"};
		}
	}
	
	pp.tet.score = 0;// 점수 초기화
	
	document.addEventListener("keydown", function(e){
		var block = pp.tet.block[pp.tet.present_block];
		switch (e.keyCode) {
		case 37: // 왼
			var cnt = 0;
			for(var i = 0;i<block.length;i++){
				if((block[i].x + pp.tet.x) == 0 || pp.tet.stack[block[i].y + pp.tet.y][block[i].x + pp.tet.x - 1].is == 1)
					cnt++;
			}
			if(cnt == 0)
				pp.tet.x -= 1;
			break;
		case 38: // 위
			pp.tet.rotate();
			break;
		case 39: // 오른
			var cnt = 0;
			for(var i = 0;i<block.length;i++){
				if((block[i].x + pp.tet.x) == pp.tet.bx-1 || pp.tet.stack[block[i].y + pp.tet.y][block[i].x + pp.tet.x + 1].is == 1)
					cnt++;
			}
			if(cnt == 0)
				pp.tet.x += 1;
			break;
		case 40: // 아래
			pp.tet.y += 1;
			break;
		case 32:
			for(var i = 0;i<pp.tet.by;i++){
				pp.tet.y += 1;
				for(var i=0;i<block.length;i++){
					if((block[i].y + pp.tet.y) >= pp.tet.by-1 || pp.tet.stack[(block[i].y + pp.tet.y) + 1][block[i].x + pp.tet.x].is == 1){
						pp.tet.game();
						return;
					}
				}
			}
			break;
		}
		pp.tet.game();
	});
	
	pp.tet.rotate = function(){
		var block = pp.tet.block[pp.tet.present_block];
		for(var i in block){
			var _y = block[i].y;
			block[i].y = block[i].x;
			block[i].x = -(_y);
		}
	}
	pp.tet.ctx.fillStyle = pp.tet.background; // 배경
	pp.tet.ctx.fillRect(0, 0, pp.tet.canvas.width, pp.tet.canvas.height);
}

pp.tet.reset = function(){
	
	pp.tet.present_block = Math.floor(Math.random() * pp.tet.block.length);
	// 구해오는 함수 다음블록
	pp.tet.next_block = Math.floor(Math.random() * pp.tet.block.length);
	
	pp.tet.stack = new Array();
	
	for(var i=0;i<pp.tet.by;i++){ // 보드 배열 초기화
		if(!Array.isArray(pp.tet.stack[i])){
			pp.tet.stack[i] = new Array();
		}
		for(var j=0;j<pp.tet.bx;j++){
			pp.tet.stack[i][j] = {is:0, colour:"gray"};
		}
	}
	
	pp.tet.score = 0;// 점수 초기화
}

pp.tet.game = function(){
	var ctx = pp.tet.ctx;
	var w = pp.tet.canvas.width;
	var h = pp.tet.canvas.height;
	var bx = pp.tet.bx;
	var by = pp.tet.by;
	var cell = pp.tet.cell;
	var block = pp.tet.block[pp.tet.present_block];
	
	ctx.fillStyle = pp.tet.background; // 배경
	ctx.fillRect(0, 0, w, h);
	
	for(var i=0;i<bx;i++){ // 쌓인것
		for(var j=0;j<by;j++){
			if(pp.tet.stack[j][i].is == 1){ // 존재하면
				ctx.fillStyle = pp.tet.stack[j][i].colour;
				ctx.fillRect(i * cell, j * cell, cell - 2, cell - 2);
			}
		}
	}
	
	// 새 블럭
	for(var i = 0; i < block.length; i++){
		var rec = block[i];
		var _x = (pp.tet.x + rec.x) * cell;
		var _y = (pp.tet.y + rec.y) * cell;
		ctx.fillStyle = rec.c;	
		ctx.fillRect(_x, _y, cell - 2, cell - 2);
	}
	
	
	
	ctx.fillStyle="black"; // 스코어
	ctx.font = "50px Arial";
	ctx.fillText("Score: " + pp.tet.score, 10, 50);
	
	
	// 다음블럭
	var nb = pp.tet.block[pp.tet.next_block];
	
	var copyblock = function(nb){
		
	}
	
	
	for(var i in nb){
		var _x = ((bx-3) + nb[i].x) * cell;
		var _y = (2 + nb[i].y) * cell;
		
		ctx.fillStyle = nb[i].c;	
		ctx.fillRect(_x, _y, cell - 2, cell - 2);
	}
	
	var x = pp.tet.x;
	var y = pp.tet.y;
	for(var i = 0; i < block.length; i++){ // 부딛혔는지 검사
		if((block[i].y + y) >= by-1 || pp.tet.stack[(block[i].y + y) + 1][block[i].x + x].is == 1){
			for(var j = 0; j < block.length; j++){
				pp.tet.stack[block[j].y + y][block[j].x + x] = {is:1, colour:block[j].c};
			}
			pp.tet.check_line();// 지워
			
			// 새블럭 생성
			pp.tet.present_block = pp.tet.next_block;
			
			pp.tet.next_block = Math.floor(Math.random() * pp.tet.block.length);
			pp.tet.x = Math.floor(bx / 2);
			pp.tet.y = 2;
			break;
		}
	}
	for(var i in pp.tet.stack[1]){
		if(pp.tet.stack[2][i].is == 1){ // 게임 종료
			xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){
					alert("점수 저장 완료");
				}
			}
			xhr.open("get", "/semi/go/getGamePoint.do?id=" + pp.tet.id + "&score=" + pp.tet.score);
			xhr.send();
			clearInterval(go);
			return;
		}
	}
}

pp.tet.check_line = function(){
	for(var i=0;i<pp.tet.stack.length;i++){
		var cnt = 0;
		for(var j=0;j<pp.tet.stack[i].length;j++){
			if(pp.tet.stack[i][j].is == 0)
				cnt++;
		}
		if(cnt == 0){
			for(var k = 0;k<pp.tet.stack[i].length;k++){
				pp.tet.stack[i][k].is = 0;
			}
			
			for(var ii = i; ii >= 1; ii--){
				for(var jj = 0; jj < pp.tet.stack[ii].length; jj++){
					pp.tet.stack[ii][jj].is = pp.tet.stack[ii-1][jj].is;
					pp.tet.stack[ii][jj].colour = pp.tet.stack[ii-1][jj].colour;
				}
			}
			for(var kk=0;kk<pp.tet.stack[0].length;kk++){
				pp.tet.stack[0][kk].is = 0;
			}
			pp.tet.score += 100;
			clearInterval(go);
			frame += 2;
			go = setInterval(function(){
				pp.tet.y++;
				pp.tet.game();
			}, 1000/frame);
		}
	}
}
