$(function(){
  
   // 创建大小写字母和数组
   var arr=["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","k","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",1,2,3,4,5,6,7,8,9];
   //功能一创建30个大小不同颜色不同位置不同
   // 透明度不同，圆形
   // 功能二 点击圆形，圆慢慢变大变淡，最后消失
   // 1创建函数 返回一个指定范围内随机整数
   // min 最小值，max最大值
   function rn(min,max){
       var n=Math.random()*(max-min)+min;
       return Math.floor(n);
   }
   //创建函数返回字符串 rgb(1,10,109)
   function rc(){
       var r=Math.floor(Math.random()*255);
       var g=Math.floor(Math.random()*255);
       var b=Math.floor(Math.random()*255);
       return `rgb(${r},${g},${b})`;
   }
   // 创建30个大小不同圆形
   // 1 获取画布元素
    var s3=document.getElementById("s3");
   // 2 创建循环遍历30
   for(var i=0;i<100;i++){
   //  2.1创建圆形
      var c=document.createElementNS("http://www.w3.org/2000/svg","circle")
   //  2.2 分别指定圆形cx,cy r fill fill-opacity
       c.setAttribute("cx",rn(0,70));
       c.setAttribute("cy",rn(0,40));
       c.setAttribute("r",rn(1,1));
       c.setAttribute("fill",rc());
       c.setAttribute("fill-opacity",Math.random());
   //  2.3 将创建圆形添加画布中
       
   //  功能二 为原型绑定点击事件
   //  2.4获取当前圆形半径修改后保存回当前元素
   //  2.5 获取当前圆形透明度修改后再保存
   //  2.6 判断如果当前圆透明度<0.05
    } 
    s3.appendChild(c) 
    //3 循环遍历4
    var str=""
    for(var i=0;i<4;i++){
      var t=document.getElementById("t3");
     var a=t.setAttribute("x",rn(15,20));
      t.setAttribute("y",rn(20,30));
      t.setAttribute("fill",rc())
      t.setAttribute("font-size",23)
      t.setAttribute("rotate",(rn(0,45)));   
      str+=arr[rn(0,60)]
    }
    t.innerHTML=str;

})