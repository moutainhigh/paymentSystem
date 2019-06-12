<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/commons-include.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
  <meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
  <meta content="yes" name="apple-mobile-web-app-capable" />
  <meta content="yes" name="apple-touch-fullscreen" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <meta name="renderer" content="webkit|ie-comp|ie-stand">
  <link rel="stylesheet" href="${applicationScope.staticFilesHost}/gateway/css/quickOpen/weui.min.css">
  <link rel="stylesheet" href="${applicationScope.staticFilesHost}/gateway/css/quickOpen/wapRegister.css?v=2017110711&author=XueYou">
  <link rel="shortcut icon" href="${applicationScope.staticFilesHost}/gateway/images/favicon.ico">
  <title>快速注册</title>
  <style>
   .weui-dialog {
    max-width: initial;
    width: 92%;
    max-width: 500px;
   }
  </style>
</head>
<body>
  <div class="container">
    <div class="page">
      <div style='text-align: center' class="page__hd">
          快速注册
      </div>
      <div class="page__bd">
          <form action="./fillSettle.html" id="form">
              <div class="weui-cells weui-cells_form">
               
                  <div class="weui-cell" id="phone-input-wrap">
                      <div class="weui-cell__hd">
                          <label class="weui-label">手机号</label>
                      </div>
                      <div class="weui-cell__bd">
                          <input id="phone-input" class="weui-input" type="tel" required pattern="REG_PHONE" maxlength="11" placeholder="请输入手机号" emptytips="请输入手机号" notmatchtips="请输入正确的手机号"/>
                      </div>
                  </div>
                  <div class="weui-cell weui-cell_vcode">
                      <div class="weui-cell__hd"><label class="weui-label">验证码</label></div>
                      <div class="weui-cell__bd">
                          <input id="verifyCode-input" class="weui-input" type="number" required pattern="REG_VCODE" maxlength="6" onkeyup="this.value = this.value.slice(0, 6);" placeholder="请输入验证码" emptytips="请输入验证码" notmatchtips="请输入正确的验证码"/>
                      </div>
                      <div class="weui-cell__ft">
                          <a id="send-vcode" class="weui-vcode-btn">获取验证码</a>
                      </div>
                  </div>
                  <div class="weui-cell">
                      <div class="weui-cell__hd">
                          <label class="weui-label">密码</label>
                      </div>
                      <div class="weui-cell__bd">
                          <input id="pass-input" class="weui-input" type="password" required pattern="REG_PASSWORD"  placeholder="请输入密码" emptytips="请输入密码" notmatchtips="请输入字母加数字的密码"/>
                      </div>
                  </div>
                   <div class="weui-cell">
                    <div class="weui-cell__hd">
                        <label class="weui-label">推荐人名称</label>
                    </div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" readonly type="text" value="${agentName }"/>
                    </div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd">
                        <label class="weui-label">推荐人编号</label>
                    </div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" readonly id="agentNo" type="text" value="${agentNo }"/>
                    </div>
                </div>
              </div>
    
              <label for="weuiAgree" class="weui-agree">
                  <input id="weuiAgree" type="checkbox" checked="checked"  name="xieyi" required tips="请阅读并同意协议" class="weui-agree__checkbox" />
                  <span class="weui-agree__text">
                      注册即代表同意以上条款<a href="javascript:void(0);" id="readTerms">《商户入网协议》</a>
                  </span>
              </label>
      
              <div class="weui-btn-area">
                  <a class="weui-btn weui-btn_primary" href="javascript:" id="toSubmit">注册</a>
              </div>
              <div class="weui-btn-area">
                  <a class="weui-btn weui-btn_primary" href="http://pay.feiyijj.com/app/download/" id="download">下载APP</a>
              </div>
          </form>
      </div>
      <div class="page__ft">
        <div class="weui-footer">
          <!-- <p class="weui-footer__links">
            <a href="#" href="javascript:void(0);" class="weui-footer__link">聚合支付</a>
          </p> -->
          <%--<p class="weui-footer__text">客服电话: 400-860-7199</p>--%>
        </div>
      </div>
    </div>
  </div>

  <!-- 相关协议 -->
  <div class="hidden" id="terms-content">
    <pre style="white-space: pre-line;  -webkit-overflow-scrolling:touch;  text-align: left;" class="protocol">
感谢您选择聚合支付有限公司（以下简称本协议）提供的网络支付服务。本用户服务协议由本公司和您签订。
 
一、服务协议的确认和接纳
 
（一）本服务是由聚合支付有限公司（以下简称“聚合支付”或“本公司”）向用户提供的网络支付服务（以下简称“本服务”或 “服务”）。为了保障您的权益，您应保证自己在注册使用本服务时具有民事权利能力和完全民事行为能力。您在自愿注册使用本服务前，必须仔细阅读并接受本服务协议所有条款。一经注册使用本服务即视为您对本服务条款的理解、接受和确认。
 
（二）本公司有权在必要时单方修改或变更本服务协议的内容，并将通过本公司网站公布最新的服务协议，不另作个別通知，您应随时关注本公司网站发布的新公告以了解相关内容。若您于任何修改或变更本服务条款后继续使用本服务，则视为您已阅读、了解、确认并同意接受修改或变更；若您不同意，则您应主动立即停止使用本服务。您在使用本服务时，应自行判断对方是否是完全民事行为能力人并自行决定是否与对方进行交易或转账给对方等，且您应自行承担与此相关的所有风险。本公司仅提供前述中介服务，并不对交易相对人的资质、信誉、信息等提供任何担保或保证。
 
（三）您同意，您使用本服务发生的所有交易，您不可撤销的授权由本公司按照本协议进行处理；同时本公司有权为提供前述服务的需要获取您的相关信息（包括但不限于身份证复印件、手机号等）。本公司按照您的操作指令进行资金的冻结、扣划完全来自于您的授权，因此造成的任何损失本公司均不承担责任。但您确认，您使用本公司服务时，您仍应完全遵守本协议及本公司制定的并不时更新的各项规则及页面提示等。
 
二、账户注册
 
在使用本服务前，您必须先注册成为本公司用户，您同意以下事项：
 
（一）仅向符合中华人民共和国法律规定的具有完全民事权利能力和民事行为能力，能够独立承担民事责任的中国大陆地区的人提供本服务。
 
（二）您必须依本协议注册的要求提供您的准确、真实、有效、最新及完整的资料，如有变更，应及时通知本公司并按照要求办理变更手续。
 
（三）您有义务维持并立即更新您的用户资料，确保其准确、真实、有效、最新及完整。若您提供任何错误、虚假、失效或不完整的资料，或者本公司有合理的理由怀疑资料为错误、虚假、失效或不完整，本公司有权暂停或终止您的用户账号，并拒绝向您提供部分或全部服务，对此本公司不承担任何责任，您承诺并同意负担因此所产生的所有损失，包括但不限于直接损失、间接损失。若因国家法律法规、部门规章或监管机构的要求，本公司需要您补充提供任何相关资料时，如您不能及时配合提供，本公司有权暂停或终止向您提供部分或全部服务。
 
（四）若因您未及时更新基本资料（包括但不限于身份证件等有效证明文件、与账户绑定的邮箱、手机号码等）导致本服务无法提供或提供时发生任何错误，您不得将此作为取消交易或拒绝付款的理由，本公司亦不承担任何责任，所有后果应由您承担。
 
（五）为了适用法律规范，本条款及任何其他的协议、告示或其他关于您使用本服务账户及服务的通知，您同意本公司使用电子方式通知您。电子方式包括但不限于电子邮件方式、或于本网站或者合作网站上公布、或无线通讯装置通知等方式。上述条款、协议、通知、告示一经发出，即视为已送达。
三、账户
 
（一）账户的使用
 
在您注册账户（以下亦简称该账户）后，您应对您的账户负责，该账户不可转让、赠与或继承。在您决定不再使用该账户时，您应向本公司申请注销该账户。
 
（二）账户安全
 
您了解并同意，确保账户、密码等的机密安全是您的责任。您将对利用该密码、账号所进行的一切行动及言论，负完全的责任，并同意以下事项：
 
1.您不可对其他任何人泄露您的账户、密码，亦不可使用其他任何人的账户或密码。
 
2.您同意如发现有第三人冒用或盗用您的账号、密码，或其他任何未经合法授权的情形，应立即以有效方式通知本公司暂停其使用本服务并采取有效的防范措施。本公司在接受您的有效通知前，对第三人使用该服务已发生之效力或后果，除非可证明本公司对此存在故意或重大过失，否则本公司将不承担任何责任。
 
3.交易异常处理：您使用本服务时同意并认可，可能由于银行本身系统问题、银行相关作业网络连线问题或其他不可抗拒因素，造成本服务无法提供、延迟、暂停提供。
 
4.当存在如下情形时，本公司有权对您账户暂停或终止提供全部或部分服务，且有权限制您所使用的产品或服务的部分或全部功能，并通过邮件或登录提示、站内信或者客户端通知等方式通知您，您应及时予以关注： 1）根据本协议的约定； 2）根据法律法规及法律文书的规定； 3）根据有权机关的要求； 4）您使用服务的行为涉嫌违反国家法律法规及行政规定的； 5）本公司基于单方面合理判断认为账户操作、资金进出等存在异常时； 6）本公司依据自行合理判断认为可能产生风险的； 7）他人向您账户错误汇入资金等导致您可能存在不当得利的； 8）您遭到他人投诉，且对方已经提供了一定证据的。
 
5.您同意，本公司有权按照包括但不限于公安机关、检察机关、法院、海关、税务机关等司法机关、行政机关、军事机关的要求或基于本公司对您资金及交易的判断及风险策略对您的资金及账户等进行查询、冻结或扣划。
 
6.在本公司合理认为有必要时，本公司无需事先通知即可终止提供本服务，并暂停、关闭或删除您名下全部或部分账户及这些账户中所有相关资料及档案。
 
四、双方权利义务
 
（一）您的权利和义务
1.您依法享有知悉您购买、使用支付产品，接受支付服务的权利。
 
2.您向本公司提供有关资料信息时，有权知悉其所提供信息的使用目的，使用范围、安全保护措施以及未提供真实信息的后果。您方享有所提供资料、交易信息受保护的权利。
 
3.您在购买支付产品或接受支付服务之前，有权知悉本公司所提供的支付产品或支付服务风险信息。
 
4.您在使用本公司支付服务过程中，可通过本公司网站的在线客服或客户服务电话与本公司联系，并获取相关的技术和服务支持。
 
5.您核对汇总和明细对账单发现不符情况的，应及时向本公司投诉或反馈，本公司设置专门的岗位接受投诉或反馈，分析差错原因，并根据情况进行差错处理。
 
6.您在注册成为本公司用户时，应如实提供相关材料。您应保证上述提交资料的合法性、真实性、准确性和完整性。若您上述信息发生变更，应提前5个工作日通知本公司，并依据本公司要求配合完成变更确认手续。
 
7.您不得将服务账户用于本协议约定范围以外的其他用途，也不得出租、转让给第三方使用。
 
8.您应妥善保管其在本公司注册的服务账户及其密码，以及安全认证工具。
 
9.您在使用本公司的网络支付服务时，应确保自身发出支付指令的合法性、真实性、有效性和完整性。
 
10.您应承诺发起的交易基于真实的交易背景，不得利用本公司提供的服务进行虚假交易。
 
11.您不得利用本公司的支付服务从事任何非法行为，不得违反中国法律、法规、规章、规范性文件及政策，不得侵犯他人的合法权益。如您是中国大陆以外的用户，还需同时遵守其所属国家或地区的法律。
 
12.您不得对本公司的支付服务系统和程序采取反向工程手段进行破解，不得对上述系统和程序（包括但不限于源程序、目标程序、软件文档、运行在本地电脑内存中的数据、客户端至服务器端的数据、服务器数据等）进行复制、修改、编译、整合和篡改，不得修改或增加本公司支付服务系统的原有功能。
 
（二）本公司的权利和义务
1.本公司负责支付系统的建设、运行和管理，应确保该系统的安全性。
 
2.本公司对您身份资料及支付信息负有保密义务，本公司不利用您的上述信息从事超出法律许可及未经您授权的活动。
 
3.本公司为您提供本协议约定的各项网络支付服务功能，并可按照约定向您收取相关服务费用。
 
4.本公司以明确的格式、内容、语言，对其提供的支付产品或服务，依法向您进行全面、充分的信息披露和风险提示。
 
5.本公司应保护贵我双方合作期内获得的您的身份基本信息、支付业务信息、会计档案等资料的安全，防止其被篡改、灭失、损毁或泄露。
 
6.本公司应充分尊重您的自主选择权，不得强迫您使用本公司提供的支付服务，不得阻碍您使用其他机构提供的支付服务。
 
7.本公司应当公平展示您可选用的各种资金、收付方式，不得以任何形式诱导、强迫您办理资金收付，不得附加不合理的条件。
 
8.本公司应确保您交易资金的安全存放和准确及时划转。
 
9.本公司故意诋毁或非法损害您声誉的，您可立即终止提供支付服务，并追偿损失。
 
10.您可拒绝支付或追索本公司违反国家法律法规或本协议约定的有关款项。
 
11.本公司建立健全风险准备金制度和交易赔付制度，并对不能有效证明因您原因导致的资金损失及时先行全额赔付，保障您的合法权益；对采用不足两类有效要素进行验证的交易，本公司承诺无条件全额承担风险损失赔付责任。
 
12.本公司将妥善处理与您之间发生的差错争议和纠纷投诉，做好协调和解释工作，并及时告知您结果。
 
13.为提供更高效和优质的服务，本公司可根据运营需要对支付服务系统进行升级，因升级需要暂停或中止提供服务的，本公司将提前在网站显著位置进行公告，并预告恢复日期。
 
14.本公司可根据支付服务运营需要，对本协议的内容进行单方修改，但修改内容生效前应依照中国人民银行相关规定在本公司网站的显著位置公布最新的服务协议。
 
15.本公司有权根据支付市场变化适时调整相应的服务费用，但应依照中国人民银行相关规定提前通知您。
五、服务内容
 
（一）服务说明
 
1.一旦您注册成为本公司用户，并选择使用本服务，则本公司将在您及（或）对方符合指定条件或状态时，支付款项给您所指定的对象，或收取他人支付给您的款项。如您未能及时对交易状态进行修改或确认或未能提交相关申请所引起的任何纠纷或损失由您本人负责，本公司不承担任何责任。
 
2.您使用服务且暂留的资金，在任何时候均独立于本公司自有资金之外，本公司并不会以任何形式挪用、侵占您的资金。
 
3.在您使用本服务期间，本公司不对代收或代付的款项的货币贬值承担任何风险，并且本公司无须向您支付此等款项的任何孳息。
 
（二）一般服务条款
 
您在使用本协议项下的服务时，为便于您查询或计量您的应收或应付款，本公司向您提供一个唯一的账号，并由您自行设置密码，您需使用绑定的电子邮箱或手机号码或者本公司允许的其它方式登录账户。您可通过本公司实现以下服务：
 
本公司为你无卡快捷支付服务，当用户购买您的商品或服务时，可通过无卡快捷支付点击付款图标，并跳转银联页面完成支付信息录入，最终完成支付完成交易。
 
（三）投诉处理
 
客服电话：请您拨打热线电话：400-8607199 ———— 客服人员记录您的问题 ———— 专人向您反馈处理，您也可以拨打客服电话咨询
 
 
七、资金结算方式
 
（一）本公司有权根据您的支付指令，自您的交易款中直接扣除相关服务费用后（如有），按本协议约定或本公司网站公布的结算规则将您的余下交易款划转到您指定收款账户，具体到账时间以银行实际入账时间为准。
 
（二）如贵我双方针对支付交易存在误差，双方应进行核对；如无法达成一致，应以本公司支付服务系统记录的数据为准。
八、免则条款
 
系统因下列状况无法正常运作，使您无法使用各项服务时，本公司不承担损害赔偿责任，该状况包括但不限于：
1.本公司在网站公告之系统停机维护期间。
2.电信设备出现故障不能进行数据传输的。
3.因台风、地震、海啸、洪水、停电、战争、恐怖袭击等不可抗力之因素，造成本公司系统障碍不能执行业务的。
4.由于黑客攻击、电信部门技术调整或故障、网站升级、银行方面的问题等原因而造成的服务中断或者延迟。
5.本公司不承担因通过网络链接、木马等方式骗取您进行支付或通过电话、即时通讯软件等方式骗取您短信验证码的网络钓鱼风险引发的欺诈交易损失。
6.本公司不承担因您通过其他渠道故意泄露卡号、密码、CVN2、有效期等账户信息或在虚假、伪冒网站泄露该等账户信息而引发的伪冒支付责任和损失。
7.您明确同意其使用本公司网络服务所存在的风险将完全由其自己承担；因其使用本公司网络服务而产生的一切后果也由其自行承担，本公司对您及其网上交易行为的影响不承担任何责任。
8.本公司不保证为向您提供便利而设置的外部链接的准确性和完整性，同时，对于该外部链接指向的不由本公司实际控制的任何网页上的内容，本公司不承担任何责任。
9.您了解在使用本服务时，可能由于银行本身系统维护问题、相关网络问题或其他不可抗力，造成托管账户的款项划转无法顺利完成导致款项划转异常，本公司不对此承担任何责任，但仍将积极协助您处理异常。
 
九、个人信息查询授权
 
1.您同意授权本公司通过依法成立的征信机构查询您的征信信息多次，授权期限为业务存续期。
 
2.您同意授权本公司向依法成立的征信机构提供因本本协议约定业务产生的您的信息（包括您在本业务中产生的不良信息，且不再另行告知您）。
 
3.您同意授权依法成立的征信机构进行以下事项： 1）同意授权依法成立的征信机构向有关机构采集您的个人信息，可依法整理、保存、加工、使用、提供，并出具个人信用报告； 2）同意授权拥有您不良信息的信息提供者可以向依法成立的征信机构提供您的不良信息，且不再另行告知您； 3）同意授权依法成立的征信机构向信息提供者采集您收入、存款、有价证券、商业保险、不动产的信息和纳税数额信息。您已被明确告知提供上述信息可能会给您带来财产或信用损失，以及其他可能的不利后果，包括但不限于：采集这些信息对您的信用评级（评分）、信用报告等结果可能产生的不利影响，以及该等信息被信息使用者依法提供给第三方后被他人不当利用的风险，但您仍然同意授权依法成立的征信机构采集这些信息；
 
十、隐私保护
 
一旦您签署本协议，即同意本公司按照以下条款来使用和披露您的个人信息。
 
1.信息收集
 
为了核实您的身份是否真实有效、是否满足受理条件，本公司有权要求您在注册时提供身份信息（姓名、身份证号码、身份证照片）、联系信息（手机号）、银行卡信息（姓名、收款行、开户行、银行卡号）等。
 
2.信息使用或披露
 
尊重您的个人隐私是我们一项基本政策。除本协议另有规定外，本公司不对外公开或向第三方提供您的信息，但以下情况除外： 1）事先获得您的明确授权； 1）事先获得您的明确授权； 2）只有披露您的个人资料，才能提供您需要的产品和（或）服务； 3）按照本协议的要求进行的披露； 4）根据法律法规的规定； 5）按照政府主管部门的要求； 6）为维护本公司及其关联公司的合法权益；
 
3.信息的存储和交换
 
您的信息和资料存储在本公司位于中国的服务器上，为了备份的需要，本公司可能将您的信息和资料传送到位于别国的服务器上。
 
您的身份资料，自业务关系结束当年或者一次性交易记账当年计起至少保存5年。您的交易记录，自交易记账当年计起至少保存5年。如您的身份资料和交易记录涉及正在被反洗钱调查的可疑交易活动，且反洗钱调查工作在前款规定的最低保存期届满时仍未结束的，将保存至反洗钱调查工作结束。法律、行政法规和其他规章对客户身份资料和交易记录有更长保存期限要求的，遵守其规定。
 
本公司作为用户信息的管理者，本公司相关信息可至国家企业信用信息公示系统查询。如果您需要进一步了解相关信息，请联系客服4007695516。
 
4.在不透露单个用户隐私资料的前提下，您授权本公司对整个用户数据库进行分析并对用户数据库进行商业上的使用。
 
5.安全  本公司按现有技术提供相应的安全措施来使本公司掌握的信息不丢失，不被滥用和变造。这些安全措施包括向其它服务器备份数据和对数据加密。
 
十一、知识产权的保护
 
（一）本公司网站上所有内容，包括但不限于著作、图片、档案、资讯、资料、网站架构、网站画面的安排、网页设计，均由本公司或本公司关联企业依法拥有其知识产权，包括但不限于商标权、专利权、著作权、商业秘密等。
 
（二）非经本公司或本公司关联企业书面同意，您不得擅自使用、修改、复制、公开传播、改变、散布、发行或公开发表本网站程序或内容。
 
（三）尊重知识产权是您应尽的义务，如有违反，您应承担损害赔偿责任。
 
十二、风险提示及特别约定
 
（一）您充分知悉，本公司仅提供支付相关服务，您应承担使用支付服务时其资金的货币贬值、汇率波动等风险。
 
（二）您充分知悉，网上交易有风险，您与他人因网上交易产生的商品或服务质量、数量、交易金额、交货时间等纠纷及损失，应由您独立承担责任。
 
（三）您对本公司所提示的风险和列示措施、说明完全理解和同意，承诺采取相关风险防范措施以尽量避免或减小风险。
 
（四）您不得利用本公司提供的服务进行任何形式的洗钱、虚假交易、资金非法套现及其它违法行为。若本公司发现您违反本约定的，本公司可立即暂停、中止或终止支付服务，向公安部门报案，且将相关信息报送有关部门。
 
十三、协议解除和终止
 
（一）贵我双方通过协商一致，可以解除本协议。
 
（二）如您违反法律法规或本协议的约定，本公司可以采取暂停提供支付服务、暂停结算等临时措施，经本公司书面通知后 10 天内您仍未改正的，本公司可以书面通知您解除本协议，但本协议另有约定的除外。
 
（三）如本公司违反法律法规或本协议的约定，经您书面通知后 10 天内本公司仍未改正的，您可以书面形式通知本公司解除本协议，本协议另有约定的除外。
 
（四）当您发生下列任一情形的，本公司可以书面形式通知您解除本协议，若给本公司或其他损失方造成损失的，您应当向本公司或其他损失方承担赔偿责任：
1.因违反法律法规，被有关机构查处或被司法机关立案或介入调查；
2.被监管机构、银行卡组织认定为不良用户，或您在监管机构的风险信息管理系统中存在不良信息；
3.利用本公司的支付服务实施违法活动的。
 
（五）本协议终止后，双方应当遵循诚实信用的原则，继续履行通知、协助、保密的义务，并妥善处理结算事宜。本公司在协议有效期内因提供支付服务收取的服务费用，不因协议终止而返还。
十四、法律适用与管辖
 
本协议的订立、执行和解释及争议的解决均适用中国大陆法律。 如双方就本协议内容或其执行发生任何争议，双方应尽量友好协商解决；协商不成时，任何一方均可向本公司所在地的人民法院提起诉讼。
 
十五、其他约定
 
（一）您应对本服务约定条款理解和认同，即对本服务所有组成部分的内容理解并认同，一旦使用本服务，您和本公司即受本服务约定条款所有组成部分的约束。
 
（二）本协议构成您与本公司对本协议之约定事项及其他有关事宜的完整协议，除本协议规定的之外，未赋予本协议各方其他权利。如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。
    </pre>
  </div>


  <script src="${applicationScope.staticFilesHost}/gateway/js/quickOpen/zepto.min.js"></script>
  <script src="${applicationScope.staticFilesHost}/gateway/js/quickOpen/weui.min.js"></script>
  <script src="${applicationScope.staticFilesHost}/gateway/js/quickOpen/wapRegister.js?v=2017110711&author=XueYou"></script>
  <script>
    window.registerPhoneInit();
  </script>
</body>
</html>
<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?89479058158df6efe8d5ba5c12635d17";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
