<template>
<!-- 随机验证码组件 -->
    <div class="s-canvas">
        <canvas id="s-canvas" :width="contentWidth" :height="contentHeight"></canvas>
        <span @click="change">换一张</span>
    </div>
</template>
<script>
export default {
  props: {
    identifyCode: {
      type: String,
      default: "1234"
    },
    fontSizeMin: {
      type: Number,
      default: 25
    },
    fontSizeMax: {
      type: Number,
      default: 30
    },
    backgroundColorMin: {
      type: Number,
      default: 255
    },
    backgroundColorMax: {
      type: Number,
      default: 255
    },
    colorMin: {
      type: Number,
      default: 0
    },
    colorMax: {
      type: Number,
      default: 160
    },
    lineColorMin: {
      type: Number,
      default: 100
    },
    lineColorMax: {
      type: Number,
      default: 255
    },
    dotColorMin: {
      type: Number,
      default: 0
    },
    dotColorMax: {
      type: Number,
      default: 255
    },
    contentWidth: {
      type: Number,
      default: 112
    },
    contentHeight: {
      type: Number,
      default: 31
    }
  },
  methods: {
    // 点击换一张 更新验证码
    change(){
     this.drawPic();
    },
    // 生成一个随机数
    randomNum(min, max) {
      return Math.floor(Math.random() * (max - min) + min);
    },
    // 生成一个随机的颜色
    randomColor(min, max,as) {
      let r = this.randomNum(min, max);
      let g = this.randomNum(min, max);
      let b = this.randomNum(min, max);
      let a = as;
      return "rgb(" + r + "," + g + "," + b +"," + a + ")";
    },
    drawPic() {
      let canvas = document.getElementById("s-canvas");
      let ctx = canvas.getContext("2d");
      ctx.textBaseline = "bottom";
      // 绘制背景
      ctx.fillStyle = this.randomColor(
        this.backgroundColorMin,
        this.backgroundColorMax,
        1
      );
      ctx.fillRect(0, 0, this.contentWidth, this.contentHeight);
      // 绘制文字
      for (let i = 0; i < this.identifyCode.length; i++) {
        this.drawText(ctx, this.identifyCode[i], i);
      }
      this.drawLine(ctx);
      this.drawDot(ctx);
    },
    drawText(ctx, txt, i) {
      ctx.fillStyle = this.randomColor(this.colorMin, this.colorMax,1);
      ctx.font =
        this.randomNum(this.fontSizeMin, this.fontSizeMax,1) + "px SimHei";
      let x = (i + 1) * (this.contentWidth / (this.identifyCode.length + 1));
      let y = this.randomNum(this.fontSizeMax, this.contentHeight - 5,1);
      var deg = this.randomNum(-45, 45,1);
      // 修改坐标原点和旋转角度
      ctx.translate(x, y);
      ctx.rotate(deg * Math.PI / 180);
      ctx.fillText(txt, 0, 0);
      // 恢复坐标原点和旋转角度
      ctx.rotate(-deg * Math.PI / 180);
      ctx.translate(-x, -y);
    },
    drawLine(ctx) {
      // 绘制干扰线
      for (let i = 0; i < 5; i++) {
        ctx.strokeStyle = this.randomColor(
          this.lineColorMin,
          this.lineColorMax,
          0.7
        );
        ctx.beginPath();
        ctx.moveTo(
          this.randomNum(0, this.contentWidth,0.7),
          this.randomNum(0, this.contentHeight,0.7)
        );
        ctx.lineTo(
          this.randomNum(0, this.contentWidth,0.7),
          this.randomNum(0, this.contentHeight,0.7)
        );
        ctx.stroke();
      }
    },
    drawDot(ctx) {
      // 绘制干扰点
      for (let i = 0; i < 80; i++) {
        ctx.fillStyle = this.randomColor(0, 255,0.7);
        ctx.beginPath();
        ctx.arc(
          this.randomNum(0, this.contentWidth,0.7),
          this.randomNum(0, this.contentHeight,0.7),
          1,
          0,
          2 * Math.PI
        );
        ctx.fill();
      }
    }
  },
  watch: {
    identifyCode() {
      this.drawPic();
    }
  },
  mounted() {
    this.drawPic();
  }
};
</script>
<style scoped>
.s-canvas {
  height: 38px;
}
.s-canvas canvas {
  margin-top: 1px;
  margin-left: 8px;
}
</style>