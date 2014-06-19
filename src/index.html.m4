define(`PAGETITLE', `Okie Time')dnl
define(`CURRENTTIME', esyscmd(`date +%s | tr -d "\n"'))dnl
<html>
<head>
<!-- What can be copyrighted is Copyright William Lieurance 2014 and is free to use for any purpose.  Everything else is the property of its owner.  -->
<title>PAGETITLE</title>
<meta name="keywords" property="keywords" content="Texas still sucks"/>
<meta name="og:title" property="og:title" content="PAGETITLE"/>
<meta name="og:url" property="og:url" content="http://www.okietime.com"/>
<meta name="og:site_name" property="og:site_name" content="PAGETITLE"/>
<meta name="og:description" property="og:description" content="A comparison of the current time where you are and the current status of the state of Texas."/>
<meta name="og:updated_time" property="og:updated_time" content="CURRENTTIME"/>
<style>

span {
  display: inline-block 
}

.inverted {
  -moz-transform: rotate(-180deg);
  -webkit-transform: rotate(-180deg);
  transform: rotate(-180deg);
  filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=2)
}

#itis {
  float:left;
  text-align:right;
  font-size: 85px;
  width: 45%;
  padding-right: 25px;
  margin-top: 100px;
}

#texassucks {
  float:left;
  text-align:center;
  font-size: 85px;
  width: 100%;
  margin-top: 25px;
}

#sig {
  position: fixed;
  bottom: 0;
  right: 0;
  font-size: 10px;
}

#sig a:link {
  color: #000000;
}

</style>
  
</head>
<body>
<div><div id="itis">It is</div><canvas id="clock" width="300" height="300">time for a new browser</canvas></div>
<div id="texassucks">and <span class="inverted">T</span>exas still sucks.</div>
<div id="sig">©2014 William Lieurance.    <a href="https://github.com/peculater/okietime">BOOMER</a></div>
  <script type="application/x-javascript">
    draw();
   
    //Lovingly stolen from http://neilwallis.com/projects/html5/clock/index.php
    // and modified slightly.

    function draw() {
      var canvas = document.getElementById('clock');
      if (canvas.getContext) {
        var c2d=canvas.getContext('2d');
        c2d.clearRect(0,0,300,300);
        //Define gradients for 3D / shadow effect
        var grad1=c2d.createLinearGradient(0,0,300,300);
        grad1.addColorStop(0,"#D83040");
        grad1.addColorStop(1,"#801020");
        var grad2=c2d.createLinearGradient(0,0,300,300);
        grad2.addColorStop(0,"#801020");
        grad2.addColorStop(1,"#D83040");
        c2d.font="Bold 20px Arial";
        c2d.textBaseline="middle";
        c2d.textAlign="center";
        c2d.lineWidth=1;
        c2d.save();
        //Outer bezel
        c2d.strokeStyle=grad1;
        c2d.lineWidth=10;
        c2d.beginPath();
        c2d.arc(150,150,138,0,Math.PI*2,true);
        c2d.shadowOffsetX=4;
        c2d.shadowOffsetY=4;
        c2d.shadowColor="rgba(0,0,0,0.6)";
        c2d.shadowBlur=6;
        c2d.stroke();
        //Inner bezel
        c2d.restore();
        c2d.strokeStyle=grad2;
        c2d.lineWidth=10;
        c2d.beginPath();
        c2d.arc(150,150,129,0,Math.PI*2,true);
        c2d.stroke();
        c2d.strokeStyle="#222";
        c2d.save();
        c2d.translate(150,150);
        //Markings/Numerals
        for (i=1;i<=60;i++) {
          ang=Math.PI/30*i;
          sang=Math.sin(ang);
          cang=Math.cos(ang);
          //If modulus of divide by 5 is zero then draw an hour marker/numeral
          if (i % 5 == 0) {
            c2d.lineWidth=8;
            sx=sang*95;
            sy=cang*-95;
            ex=sang*120;
            ey=cang*-120;
            nx=sang*80;
            ny=cang*-80;
            c2d.fillText(i/5,nx,ny);
          //Else this is a minute marker
          } else {
            c2d.lineWidth=2;
            sx=sang*110;
            sy=cang*110;
            ex=sang*120;
            ey=cang*120;
          }
          c2d.beginPath();
          c2d.moveTo(sx,sy);
          c2d.lineTo(ex,ey);
          c2d.stroke();
        }
        //Fetch the current time
        var ampm="AM";
        var now=new Date();
        var hrs=now.getHours();
        var min=now.getMinutes();
        var sec=now.getSeconds();
        c2d.strokeStyle="#000";
        c2d.lineWidth=6;
        
        
        c2d.save();
        //Draw clock pointers but this time rotate the canvas rather than
        //calculate x/y start/end positions.
        //
        c2d.lineWidth=8;
        //Draw hour hand
        c2d.rotate(Math.PI/6*(hrs+(min/60)+(sec/3600)));
        c2d.beginPath();
        c2d.moveTo(0,10);
        c2d.lineTo(0,-60);
        c2d.stroke();
        c2d.restore();
        c2d.save();
        c2d.lineWidth=6;
        //Draw hour hand
        //Draw minute hand
        c2d.rotate(Math.PI/30*(min+(sec/60)));
        c2d.beginPath();
        c2d.moveTo(0,20);
        c2d.lineTo(0,-110);
        c2d.stroke();
        c2d.restore();
        c2d.save();
        //Draw second hand
        c2d.lineWidth=4;
        c2d.rotate(Math.PI/30*sec);
        c2d.strokeStyle="#E33";
        c2d.beginPath();
        c2d.moveTo(0,20);
        c2d.lineTo(0,-110);
        c2d.stroke();
        c2d.restore();
        
        //Additional restore to go back to state before translate
        //Alternative would be to simply reverse the original translate
        c2d.restore();
        setTimeout(draw,1000);
      }
    }
    </script>
</body>
</html>
