function pantalk() {
	this.div = document.createElement("div");
	this.div.style.width = 100;
	this.div.style.height = 100;
	
	this.width = 100;
	this.height = 100;
	
	this.canvas = document.createElement("canvas");
	this.context = this.canvas.getContext("2d");
}

var pt = new pantalk();
document.body.appendChild(pt.div);

pt.context.fillStyle = "blue";
pt.context.fillRect(0, 0, pt.width, pt.height);