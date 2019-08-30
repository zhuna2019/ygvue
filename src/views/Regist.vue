<template>
    <div class="container">
         <!-- 头部 -->
         <div class="header">
             <div class="logo">
                 <router-link to='/' ><img src="../../public/imgs/logo.jpg" alt=""></router-link>
            </div>
            <div>
               <h3 class="regtext">注册</h3>
            </div>
         </div>
         <!-- 注册区域 -->
         <div class="reg">
             
            <div class="content"> 
                <!--第一行 -->
             <div class="row1">
                 <div>用户名</div>
                 <div>
                     <input v-model="uname" vlaue="uname" type="text" placeholder="请输入密码">
                 </div>
             </div>
             <span :class="type">用户名必须6-8位字母或数组</span>
             <!--第二行 -->
             <div class="row2">
                 <div>密码</div>
                 <div><input v-model="upwd" vlaue="upwd" type="password" placeholder="请输入密码"> 
                 </div>     
             </div>
              <span :class="type">用户密码必须6-8位字母或数组</span>
             <!--第三行 -->
             <div class="row3">
                 <div>真实姓名</div>
                 <div><input v-model="user_name" vlaue="user_name" type="text" placeholder="请输入真实姓名"> </div>
             </div>
             <!--第四行 -->
             <div class="row4">
                 <div>电话</div>
                 <div><input v-model="phone" vlaue="phone" type="text" placeholder="请输入电话号码"> </div>
             </div>
           
            
             <!--第五行 -->
             <div class="row5">
                 <div>图形验证码</div>
                 <div><input type="text" placeholder="图形验证码" id="inCode"> </div>
                <random-code @click.native="refreshCode" :identifyCode="identifyCode" class="myident"></random-code>
             </div>
              <!--第六行 -->
             <div class="row6">
                 <div><input type="checkbox" id="chb">我已阅读同意</div>
                 <el-button type="text" @click="dialogVisible = true">&lt;&lt;易果服务协议&gt;&gt; &nbsp;</el-button>
                 <el-dialog
                    title="易果服务协议"
                    :visible.sync="dialogVisible"
                    width="30%"
                    :before-close="handleClose">
                    <span id="content">
                        本通用服务条款（本“协议”）由 GoDaddy.com, LLC, a Delaware limited liability company（“GoDaddy”）与您签订，并自您使用本网站（“网站”）之日起或电子接受之日起生效。本协议规定了您使用本网站以及通过本网站购买或访问的产品和服务的一般条款和条件（单独和统称为“服务”）。服务协议和附加政策适用于某些服务，并且是（不代替）本协议的补充。如果服务协议的条款与本协议的条款存在冲突，则以本协议为主。
                        术语“我们”、“我们的”指的是 GoDaddy。术语“您”、“您的”、“用户”或“客户”指的是接受本协议的任何个人或实体（并可访问您的账户或使用服务）。本协议中的任何条款都不可被视为授予第三方权利或权益。
                        GoDaddy 拥有唯一及绝对的酌情权，可以随时变更或修改本协议、本协议内加入的任何政策或协议条款，此类变更或修改在发布到本网站时立即生效。如果您在此类变更或修改后使用了本网站或服务，则表明您接受最后修订的本协议。如果您不同意遵守最后修订的本协议，请停止使用（或继续使用）本网站或服务。另外，GoDaddy 可能会不定期地以电子邮件方式通知您有关本协议的变更或修改。因此，请务必确保您的账户（“账户”）信息（包括您的电子邮件地址）为最新信息。若您因电子邮件地址不准确或过时未能收到电子邮件通知，GoDaddy 对此不承担任何责任。此外，GoDaddy 可能会因您违反或违反本协议的任何条款而终止您对服务的使用。GODADDY 保留对本网站或服务的任何方面随时进行修改、更改或终止的权利，其中包括但不限于相关方面的价格及费用。
                        </span>
                    <span slot="footer" class="dialog-footer">
                        <el-button type="primary" @click="dialogVisible = false">同意并继续</el-button>
                    </span>
                </el-dialog>
                <!-- 隐私政策协议 -->
                 <el-button type="text" @click="dialogVisible = true">&lt;&lt;隐私政策&gt;&gt;</el-button>
                 <el-dialog
                    title="隐私政策"
                    :visible.sync="dialogVisible"
                    width="30%"
                    :before-close="handleClose">
                    <span id="content">
                        本通用服务条款（本“协议”）由 GoDaddy.com, LLC, a Delaware limited liability company（“GoDaddy”）与您签订，并自您使用本网站（“网站”）之日起或电子接受之日起生效。本协议规定了您使用本网站以及通过本网站购买或访问的产品和服务的一般条款和条件（单独和统称为“服务”）。服务协议和附加政策适用于某些服务，并且是（不代替）本协议的补充。如果服务协议的条款与本协议的条款存在冲突，则以本协议为主。
                        术语“我们”、“我们的”指的是 GoDaddy。术语“您”、“您的”、“用户”或“客户”指的是接受本协议的任何个人或实体（并可访问您的账户或使用服务）。本协议中的任何条款都不可被视为授予第三方权利或权益。
                        GoDaddy 拥有唯一及绝对的酌情权，可以随时变更或修改本协议、本协议内加入的任何政策或协议条款，此类变更或修改在发布到本网站时立即生效。如果您在此类变更或修改后使用了本网站或服务，则表明您接受最后修订的本协议。如果您不同意遵守最后修订的本协议，请停止使用（或继续使用）本网站或服务。另外，GoDaddy 可能会不定期地以电子邮件方式通知您有关本协议的变更或修改。因此，请务必确保您的账户（“账户”）信息（包括您的电子邮件地址）为最新信息。若您因电子邮件地址不准确或过时未能收到电子邮件通知，GoDaddy 对此不承担任何责任。此外，GoDaddy 可能会因您违反或违反本协议的任何条款而终止您对服务的使用。GODADDY 保留对本网站或服务的任何方面随时进行修改、更改或终止的权利，其中包括但不限于相关方面的价格及费用。
                        </span>
                    <span slot="footer" class="dialog-footer">
                        <el-button type="primary" @click="dialogVisible = false">同意并继续</el-button>
                    </span>
                </el-dialog>
             </div>
             <!-- 注册按钮 -->
             <div><button @click="load" id="btn" class="btn1">立即注册</button></div></div>
            <div class="right">
                <div class="">我已注册,现在就<router-link to='Login'>立即登录</router-link> </div>
                <div><img src="../../public/imgs/register.png" alt=""></div>
            </div>
         </div>
          <my-footer/>
    </div>
</template>
<script>
export default {
    data(){
        return{
            uname:"",
            upwd:"",
            user_name:"",
            phone:"",
            dialogVisible: false,
            identifyCodes:"1234567890abcdefghijklmnopqrstuvwxyz",
            identifyCode:"",
            type:{
                open:true,
                close:false
            },
        }
    },
    methods:{
        //  设置随机验证码
        randomNum(min, max) {
            return Math.floor(Math.random() * (max - min) + min);//返回一个随机数
            },
            //刷新验证码
        refreshCode() {
            this.identifyCode = "";
            this.makeCode(this.identifyCodes, 4);
            },
        makeCode(o, l) {
            for (let i = 0; i < l; i++) {
            this.identifyCode += this.identifyCodes[this.randomNum(0, this.identifyCodes.length)];
            }
            // console.log(this.identifyCode);
        },
        handleClose(done) {
           this.$confirm('确认关闭？')
              .then(_ => {
                 done();
                })
              .catch(_ => {});
             },  
        load(){       
          // 获取请求url
        var url="api/regist"
        // 获取请求参数
        var uname=this.uname;
        var upwd=this.upwd;
        var user_name=this.user_name;
        var phone=this.phone
        var obj={uname,upwd,user_name,phone}  
        // 如果同意按钮没有选则提示选中
        if(!chb.checked){
             this.$message.error('请接受服务协议');
        }else if(inCode.value!==this.identifyCode){
           this.$message.error('图片验证码错误');
        }else if(chb.checked && inCode.value===this.identifyCode){
        // 发送请求
        this.axios.get(url,{params:obj}).then(result=>{
           if(result.data.affectedRows>0){
               this.$router.push("/login")
           }
         })
        }
      },
    }, 
    created() {
        //初始化验证码
        this.refreshCode();
        },
    mounted(){
        this.identifyCode = "";
        this.makeCode(this.identifyCodes, 4);
    }
}
</script>
<style scoped>
.open{
    display:block;
    color:red;
    font-size:12px;
}
.close{
    display:none;
    color:red;
    font-size:12px;
}
#content{
    display:block;
    width: 100%;
    height:20rem;
    overflow:auto;
}
.header{
    width:100%;
    height:4rem;
    background:#eee;
    display:flex;
    margin-bottom:3rem;
}
.logo{
    margin-top:1rem;
}
.regtext{
    color:rgb(39, 121, 46);
    margin-left:10rem;
    margin-top:1rem;
}
a{
    color:rgb(10, 167, 101);
    margin-left:0.5rem;
    text-decoration: none;
}
.reg{
    display:flex;  
    border:1px solid rgb(6, 179, 135);
    border-top:none;
}

.content{
    display:flex;
    flex-direction: column;
    width:70%;
    align-items: center;
    border-right:1px solid #aaa;
    margin-bottom:4rem;
}
.row1,.row2,.row3,.row4,.row5,.row6{
   
    display:flex;
    margin-top:2rem;
    align-items: flex-start;
}
.row6{
    font-size:14px;
    margin-left:5rem;
}
.row1 input,.row2 input,.row3 input,.row4 input,.btn1{
    width:15rem;
    height:2.5rem;
    padding-left:1rem;
    margin-left:1rem;
    outline: 0;  
}
.row5{
    text-align: left;
}
.row5 input{
    width:8rem;
    height:2.5rem;
    padding-left:1rem;
    margin-left:1rem;
    outline: 0;
}
.row1 input{
    margin-right:1rem;
}
.row3 input{
    margin-right:2rem;
}
#chb{
    margin-top:1rem;
}
.btn1{
    background:rgb(4, 158, 81);
    outline:0;
    border:0;
    margin-top:1rem;
}
</style>


