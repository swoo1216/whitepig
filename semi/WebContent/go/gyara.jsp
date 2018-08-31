<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<button type="button" onclick="startgame()">시작</button>
	<script type="text/javascript">
	var gaming = false;
	var width = 1000, height = 500, range = 30;
	var player = {x: 500, y: 250, width: 40, height: 40, spd:10};
	var enemy = {x: 0, y: 0, width: 30, height: 30, spd:5};
	var enemy2 =  {x: 10, y: 0, width: 30, height: 30, spd:5};
	var enemy3 =  {x: 20, y: 0, width: 30, height: 30, spd:5};
	
	var enemy4 =  {x: 0, y: 0, width: 30, height: 30, spd:5};
	var enemy5 =  {x: width, y: 0, width: 30, height: 30, spd:5};
	
	var enemy6 =  {x: 0, y: height, width: 30, height: 30, spd:5};
	var score = 0, count = 0, key = [];
	var canvas = document.createElement("canvas");
	canvas.width = width;
	canvas.height = height;
	canvas.style.border = "1px solid black";
	var ctx = canvas.getContext("2d");
	document.body.appendChild(canvas);
	
	window.addEventListener("keydown", function(){
		if(event.keyCode == 32){
			startgame();
		}
	}, false);
	//start
	var end;
	function startgame(){
		if(gaming)
			return;
		gaming = true;
		width = 1000, height = 500, range = 30;
		player = {x: 500, y: 250, width: 40, height: 40, spd:10};
		enemy = {x: 0, y: 0, width: 30, height: 30, spd:5};
		enemy2 =  {x: 10, y: 0, width: 30, height: 30, spd:5};
		enemy3 =  {x: 20, y: 0, width: 30, height: 30, spd:5};
		
		enemy4 =  {x: 0, y: 0, width: 30, height: 30, spd:5};
		enemy5 =  {x: width, y: 0, width: 30, height: 30, spd:5};
		
		enemy6 =  {x: 0, y: height, width: 30, height: 30, spd:5};
		score = 0
		count = 0
		key = [];
		end = setInterval(function(){
			  update();
			  draw();
			},10)
	}
	
	function draw(){
	  ctx.save();
	  ctx.fillStyle = "white";
	  ctx.fillRect(0,0,width,height);
	  ctx.fillStyle = "red";
	  ctx.fillRect(enemy.x-enemy.width/2, enemy.y-enemy.height/2, enemy.width, enemy.height);
	  ctx.fillRect(enemy2.x-enemy2.width/2,enemy2.y-enemy2.height/2,enemy2.width,enemy2.height);
	  ctx.fillRect(enemy3.x-enemy3.width/2,enemy3.y-enemy3.height/2,enemy3.width,enemy3.height);
	  
	  ctx.fillRect(enemy4.x-enemy4.width/2,enemy4.y-enemy4.height/2,enemy4.width,enemy4.height);
	  ctx.fillRect(enemy5.x-enemy5.width/2,enemy5.y-enemy5.height/2,enemy5.width,enemy5.height);
	  ctx.fillRect(enemy6.x-enemy6.width/2,enemy6.y-enemy6.height/2,enemy6.width,enemy6.height);
	  ctx.fillStyle = "black";
	  ctx.fillRect(player.x-player.width/2,player.y-player.height/2,player.width,player.height);
	  ctx.font = "20px Arial";
	  ctx.fillStyle = "black";
	  ctx.fillText("Score: "+score,0,20);
	  ctx.restore();
	}
	function update(){
	  if(player.x >= enemy.x-range && player.x <= enemy.x+range && player.y >= enemy.y-range && player.y <= enemy.y+range ){
	    gameover();
	    gaming = false;
	    
	  }
	  if(player.x >= enemy2.x-range && player.x <= enemy2.x+range && player.y >= enemy2.y-range && player.y <= enemy2.y+range ){
		  gameover();
		  gaming = false;
		  }
	  if(player.x >= enemy3.x-range && player.x <= enemy3.x+range && player.y >= enemy3.y-range && player.y <= enemy3.y+range ){
		  gameover();
		  gaming = false;
		  }
	  if(player.x >= enemy4.x-range && player.x <= enemy4.x+range && player.y >= enemy4.y-range && player.y <= enemy4.y+range ){
		  gameover();
		  gaming = false;
		  }
	  if(player.x >= enemy5.x-range && player.x <= enemy5.x+range && player.y >= enemy5.y-range && player.y <= enemy5.y+range ){
		  gameover();
		  gaming = false;
		  }
	  if(player.x >= enemy6.x-range && player.x <= enemy6.x+range && player.y >= enemy6.y-range && player.y <= enemy6.y+range ){
		  gameover();
		  gaming = false;
		  }
	  if(enemy.y > height){
	    enemy.x = Math.ceil(Math.random()*width);
	    enemy.y = 0;
	    enemy.spd = 1;
	    score = score + 10;
	  }
	  if(enemy2.y > height){
		    enemy2.x = Math.ceil(Math.random()*width);
		    enemy2.y = 0;
		    enemy2.spd = 1;
		    score = score + 10;
	 }
	 if(enemy3.y > height){
		    enemy3.x = Math.ceil(Math.random()*width);
		    enemy3.y = 0;
		    enemy3.spd = 1;
		    score = score + 10;
	 }
	  
	  if(enemy4.x > width){
		  enemy4.x = 0;
		  enemy4.y = Math.ceil(Math.random()*height);
		  enemy4.spd = 1;
		  score = score + 100;
	  }
	  if(enemy5.x < 0){
		  enemy5.x = width;
		  enemy5.y = Math.ceil(Math.random()*height);
		  enemy5.spd = 1;
		  score = score + 100;
	  }
	  if(enemy6.y < 0){
		  enemy6.x = Math.ceil(Math.random()*width);
		  enemy6.y = height;
		  enemy6.spd = 1;
		  score = score + 100;
	  }
	  
	  if(key[37]&&player.x-player.width/2>0) player.x -= player.spd;
	  if(key[38]&&player.y-player.height/2>0) player.y -= player.spd;
	  if(key[39]&&player.x+player.width/2<width) player.x += player.spd;
	  if(key[40]&&player.y+player.height/2<height) player.y += player.spd;
	  enemy.y += enemy.spd;
	  enemy.spd += Math.floor(Math.random() * 50) / 100;
	  enemy2.y += enemy2.spd;
	  enemy2.spd += Math.floor(Math.random() * 50) / 100;
	  enemy3.y += enemy3.spd;
	  enemy3.spd += Math.floor(Math.random() * 50) / 100;
	  
	  enemy4.x += enemy4.spd;
	  enemy4.spd += Math.floor(Math.random() * 50) / 100;
	  enemy5.x -= enemy5.spd;
	  enemy5.spd += Math.floor(Math.random() * 50) / 100;
	  
	  enemy6.y -= enemy6.spd;
	  enemy6.spd += Math.floor(Math.random() * 50) / 100;
	}
	window.addEventListener("keydown", function(e){
	  key[e.keyCode] = true;
	});
	window.addEventListener("keyup", function(e){
	  key[e.keyCode] = false;
	});
	function gameover(){
		clearInterval(end);
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
				alert("종료");
			}
		}
		xhr.open("get", "/semi/go/getGamePoint.do?id=${sessionScope.id}&getPoint=" + score);
		xhr.send();
	}
	</script>
</body>
</html>