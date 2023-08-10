<%@ include file="/common/Include.jsp" %>
<%
String usrName = (String)session.getAttribute("user");
%>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Account summary"/>
<tiles:put name="menu" value="/common/user_left.jsp?src=faq"/>
<tiles:put name="header" value="/common/header.jsp"/>
	<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>

<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=faq"/>
<tiles:put name="page_header" type="String" >
&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;

</tiles:put>
<tiles:put name="content" type="String">
<br>

<table align="left" class="miniStmtBackBorder" width="99%" cellspacing="0" cellpadding="0" >
					<tr class="miniStmtBack">
						<td>

<table>

 <TR>    <TD class=txt_body vAlign=top><A 
                  name=1></A><STRONG>Who is eligible for 
                  NetBanking ?</STRONG><BR><%= cprContextObj.getSbankename() %>  is pleased to provide the Internet Banking Sevices to its 
				  Savings and Current Account holders, who can access their account through NetBanking. 
                 </TD>
				 </TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=txt_body vAlign=top><BR><BR><BR><A 
                  name=2></A><STRONG>Is there any charge for this 
                  service?</STRONG><BR>No. Currently, Maiwand Bank offers NetBanking free 
                  with its accounts. However, all minimum balance/deposit amount 
                  requirements of the relevant accounts will need to be 
                  honoured. 
                  </TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=txt_body vAlign=top><BR><BR><BR><A 
                  name=4></A><STRONG>What can I do using 
                  NetBanking?</STRONG><BR>Currently, you can do any of the 
                  following: <BR><BR><STRONG>Queries </STRONG>-<BR><BR>Check 
                  your Balance<BR>See your Statement<BR>Inquire about cheque 
                  status<BR>Ask for a Statement<BR>Ask for a Cheque 
                  Book <BR>Update your 
                  profile<BR><BR><STRONG>Transactions -<BR><BR></STRONG>Stop a 
                  Cheque 
                  <BR>Transfer funds between your accounts
				  <BR>  Pay Maiwand Bank Credit Card Dues 
                 </TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=txt_body vAlign=top><BR><BR><BR><A 
                  name=5></A><STRONG>What are the locations for which Demand Draft 
                  request can be made for?</STRONG><BR>Maiwand Bank can issue Demand 
                  Drafts at all the locations where it has a branch or have an 
                  arrangement with its correspondent bank for the same. 
                  </TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=txt_body vAlign=top><BR><BR><BR><A 
                  name=7></A><STRONG>What do you mean by the term :- Transactions are 
                  "Real-Time online"?</STRONG><BR>Maiwand Bank has designed the 
                  NetBanking service in such a way that it takes your requests 
                  and acts on them immediately in a secure way. All transactions that will 
                  affect your balance (except Demand Draft request) are done 
                  automatically by the system. For example, Fund Transfer, Stop 
                  Payment instruction. All the balances 
                  that are displayed to you are as of that instant and would 
                  cover transactions done by you over any of bank's delivery channels. 
                 </TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top>
				</TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=txt_body vAlign=top><BR><BR><BR><A 
                  name=8></A><STRONG>When will my transactions affect my 
                  account?</STRONG><BR> Immediately ! Except in the case of Demand 
                  Draft request, which will be processed during the banking 
                  hours on the next working day. 
				</TD>
			</TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=txt_body vAlign=top><BR><BR><BR><A 
                  name=9></A><STRONG>How will I know that my transaction has 
                  been completed?</STRONG><BR>The NetBanking system does one of 
                  the following, depending upon the transaction you have 
                  requested: <BR>
                  <UL type=square>
                    <LI>Displays the information requested 
                    <LI>Accepts your instruction and displays an appropriate 
                    message to the effect or gives you a transaction reference 
                    number which you may use to refer to your transaction in all 
                    future communication regarding the same. 
                    <LI>Displays an appropriate message as a reason, why it cannot 
                    complete your transaction currently or asks you to try again. </LI></UL>
                  </TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=txt_body vAlign=top><BR><BR><BR><A 
                  name=10></A><STRONG>How safe are my requests/transactions on 
                  NetBanking? </STRONG><BR>You can be assured of complete 
                  privacy when you use Maiwand Bank's NetBanking facility. We have 
                  built several stepped checks to safeguard your NetBanking 
                  transactions. Initially when you gain access to your account, you will 
                  be asked to change your (system generated) password(s) on the very first login in the NetBanking.
				  Thereafter you need to enter your Transaction password 
                  to verify your identity. To maximise the security and 
                  confidentiality of your transactions, your password is not 
                  accessible to anyone, not even bank employees.<BR><BR>When you 
                  bank with us on the Internet, you are always in a secure zone. 
                  To ensure the security of your transactions, we use a 
                  technology called Secured Socket Layer (SSL), which involves 
                  scrambling of the information between you and the Bank. If an 
                  unauthorised user tries to access your account by keying in 
                  various combinations while trying to guess your password, your 
                  account will automatically get locked. Moreover, when you 
                  log-in to NetBanking, your last date and time of log-in will 
                  be displayed so that you can make sure that nobody has 
                  accessed your account since your last log-out.<BR><BR>In addition to these online 
                  security features, we have in place a dedicated team to 
                  monitor the access to the web server acreoss firewall and to prevent 
                  unauthorised access.<BR><BR>These features work together to 
                  maximise the security of your banking transactions. However, 
                  in order to ensure complete security, please remember to 
                  log-out of NetBanking after you have completed your 
                  transactions. 
                 </TD>
			</TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=txt_body vAlign=top><BR><BR><BR><A 
                  name=11></A><STRONG>Are there any special benefits to me for 
                  using NetBanking?</STRONG><BR>There are various befenfits of 
                  using NetBanking <BR><BR>
                  <UL>
                    <LI>Free Stop Cheque 
                    <LI>Statement Request 
                    <LI>Free Fund Transfer 
                    <LI>Request of Lost of ATM /Credit Cards</LI></UL>
                 </TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=txt_body vAlign=top><BR><BR><BR><A 
                  name=12></A><STRONG>What kind of hardware(PC)  and software(browsers) are 
                  recommended for using NetBanking more 
                  efficiently?</STRONG><BR><B>Hardware:</B> You need to have a 
                  Pentium PC with 128 MB RAM, 2.1 GB Hard Disk Space with 500MB 
                  free space.<BR><BR><B>Software:</B> You need to have a 
                  browser: Internet Explorer (Version 6.5 or above)  and Netscape Navigator 
                  (Version 4.7).<BR><BR>
                  </TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=txt_body vAlign=top><BR><BR><BR><A 
                  name=13></A><STRONG>I cannot read some digits of the password. 
                  What should I do?</STRONG><BR>The IPIN (password) is a number 
                  randomly generated by the system, and the only person having 
                  access to it is you. We would therefore request you to apply 
                  for re-generation of the password at the nearest branch. 
                  </TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=txt_body vAlign=top><BR><BR><BR><STRONG>What is the process for regeneration of 
                  IPIN (password)?</STRONG><BR>Regeneration is a request for 
                  another IPIN. For this you can call 
                  if you have a Telephone Identification Number 
                  (TIN)<BR><BR>
                  <UL type=square>
                    <LI>NetBanking form for Individuals 
                    <LI>NetBanking form for Corporates </LI></UL>
 </TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>

              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=txt_body vAlign=top><BR><BR><BR><A 
                  name=16></A><STRONG>Why is my NetBanking IPIN (password) not 
                  functioning? </STRONG><BR>There could be various reasons for 
                  the IPIN (password) not functioning: 
                  <UL type=square>
                    <LI>The IPIN (password) is case-sensitive and may not have 
                    been entered in the same uower or lpper case as mentioned in 
                    the IPIN sealed envelope sent to you. 
                    <LI>The account has not been last accessed for more than 180 
                    days. </LI></UL>
                  </TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=txt_body vAlign=top><BR><BR><BR><A 
                  name=17></A><STRONG>How can I log-in if I have forgotten my 
                  password?</STRONG><BR>You need a new IPIN (password) to login 
                  in case you have forgotten your IPIN. For a new IPIN you can 
                  call  
                  </A>if you have a Telephone Identification Number 
                  (TIN)<BR><BR>
                  
                  </TD></TR>
             
             
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=txt_body vAlign=top><BR><BR><BR><A 
                  name=19></A><STRONG>I am getting the message "Access denied". 
                  What do I do?</STRONG><BR>Reasons you could be locked out 
                  for:<BR>
                  <UL type=square>
                    <LI>You have not used the NetBanking facility for more than 
                    180 days 
                    <LI>You have entered the wrong IPIN (password) five (5)  
                    times and could be a user error on your part 
                    <LI>If the IPIN has been forgotten, then we have no choice 
                    but to regenerate on an authenticated request confirmed from yourself. 
                  </LI></UL>
			</TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=txt_body vAlign=top><BR><BR><BR><A 
                  name=20></A><STRONG>I have changed my password but am unable 
                  to use my new or old passwords. What am I supposed to 
                  do?</STRONG><BR>This is possibly because: <BR>
                  <UL type=square>
                    <LI>You have not keyed in the new IPIN (password) correctly 
                    <B>OR</B> 
                    <LI>After Three unsuccessful attempts, access to NetBanking 
                    has been disabled for security reasons.<BR><BR>
                    <LI>If you remember your IPIN  to submit a request for enabling 
                    your access to NetBanking.<BR><BR>
                    <LI>If you have forgotten your IPIN you need to submit a 
                    request for regeneration. You can call  
                    if you have a Telephone Identification Number 
                    (TIN)<BR><BR><B>OR</B><BR><BR> to download the NetBanking 
                    Password Regeneration form. The completed form can be 
                    submitted at the nearest Maiwand  
                    Bank branch. 
				</LI></UL></TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=txt_body vAlign=top><BR><BR><BR><A 
                  name=21></A><STRONG>How can I block my IPIN (password) or 
                  un-register?</STRONG><BR>We require a written instruction from 
                  you to block your IPIN. 
                  </TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=txt_body vAlign=top><BR><BR><BR><A 
                  name=26></A><STRONG>What are the measures I can take to ensure 
                  greater security?</STRONG><BR>
                  <UL type=square>
                    <LI>You should log-out from the NetBanking when leaving your 
                    PC. 
                    <LI>Always change your password continuously, choose 
                    "strong" 6 to 8 digit passwords (alphanumeric) and change 
                    them regularly; avoid obvious passwords (names of family 
                    members, pets, favourite musician etc), and don't tell 
                    anyone else your passwords. 
                    <LI>You should not write a password down on any paper which 
                    may be easily accessible to anyone. 
                    <LI>Put in a power-on password in your machine so that 
                    nobody else can switch on your machine. 
                    <LI>Have a screensaver password so that when you are away 
                    from your workstation nobody else can access it. 
                    <LI>If you think someone knows your password go online and 
                    change it immediately 
                    <LI>If you are using the Internet in a public place (e.g. a 
                    Cyber Cafe) do not leave the PC unattended, and ensure that 
                    no-one is watching what you type 
                    <LI>Logoff from NetBanking upon completion of your session. 
                    Use the Log-out button to Log out so that the session closes 
                    and don't shut the window to Log off. This will prevent the 
                    viewing of previous pages of your online session via your 
                    PC. 
                    <LI>You should consider running a Personal Firewall, which 
                    will prevent unauthorised persons from accessing your 
                    computer and guard against the introduction of malicious 
                    programs onto your PC </LI></UL>
                 </TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=txt_body vAlign=top><BR><BR><BR><A 
                  name=27></A><STRONG>Who is eligible for Credit Cards 
                  NetBanking?</STRONG><BR>All Maiwand Bank customers who are 
                  <UL type=square>
                    <LI>NetBanking users and have an 
                    <LI>Maiwand Bank Credit Card </LI></UL>Your card should be in 
                  regular status for accessing your card account through 
                  NetBanking 
                  </TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=txt_body vAlign=top><BR><BR><BR><A 
                  name=28></A><STRONG>Is there any charge for Credit Cards 
                  NetBanking service?</STRONG><BR>No. This service is offered 
                  free of charge 
                  </TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=txt_body vAlign=top><BR><BR><BR><A 
                  name=29></A><STRONG>How can I register for Credit Cards 
                  NetBanking service?</STRONG><BR>The process for registering 
                  your Credit Card for NetBanking is easy. 
                  <UL type=square>
                    <LI>If you are an Maiwand Bank Account Holder and have already 
                    registered for NetBanking, <BR><BR><STRONG>Step 1</STRONG> 
                    On Maiwand  
                    Bank website page Choose "NetBanking" option and click 
                    on LOGIN<BR><STRONG>Step 2</STRONG> On the next page click 
                    on "continue" button<BR><STRONG>Step 3</STRONG> Now you are 
                    on NetBanking log in page. Please Type your Customer 
                    Identification Number and NetBanking password (IPIN) to log 
                    in. This brings you on the NetBanking page page that gives 
                    all your account summary details and other Transaction 
                    options.<BR><STRONG>Step 4</STRONG> Please click on "Credit 
                    Cards" tab.<BR><STRONG>Step 5</STRONG> Click on "Register 
                    New Card" option on the left hand side 
                    panel.<BR><STRONG>Step 6</STRONG> Please enter your 16 digit 
                    Maiwand  Bank Credit Card number, expiry date and your Credit 
                    Card PIN number and click on "submit" to link your card to 
                    your NetBanking ID.<BR><BR>
                    <LI>If you are an Maiwand  Bank Account Holder and haven't 
                    registered for NetBanking, you have to first register for 
                    NetBanking by filling in a NetBanking application form 
                  </LI></UL>Download the e-Age Banking form (below), complete it 
                  and submit it at the nearest 
                  <UL type=square>
                    <LI>NetBanking form for Individuals 
                    <LI>NetBanking form for Corporates</LI></UL>
				</TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=txt_body vAlign=top><BR><BR><BR><A 
                  name=30></A><STRONG>What can I do using Credit Cards 
                  NetBanking?</STRONG><BR>Currently, you can use the following 
                  Credit Cards NetBanking 
                  features<BR><BR><STRONG>Registration<BR>De-Registration<BR>View 
                  Account Information<BR>View Unbilled transactions<BR>View 
                  &amp; download Credit Card statement<BR>Register/De-register 
                  for Autopay<BR>Credit Cards Payment<BR>Update contact details 
                  </STRONG>
                 </TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=txt_body vAlign=top><BR><BR><BR><A 
                  name=32></A><STRONG>What all information can I view in Credit 
                  Cards account summary?</STRONG><BR>The following Credit Cards 
                  account details are displayed on the screen 
                  <UL type=square>
                    <LI>Total Credit limit <BR>(This the total credit limit 
                    assigned to you at the time of card set up) 
                    <LI>Available Credit limit<BR>(This is the credit limit 
                    available to you as of today and is exclusive of total 
                    outstanding - billed or unbilled) 
                    <LI>Available Cash limit<BR>(This is the cash limit 
                    available to you as of today) 
                    <LI>Total billed amount<BR>(This is the total billed amount 
                    up to your latest statement date) 
                    <LI>Payment due date<BR>(This is the payment due date for 
                    your latest statement) 
                    <LI>Minimum Amount due<BR>(This is the min amount due for 
                    your latest statement) 
                    <LI>Total unbilled amount<BR>(This is the sum of all 
                    transactions after the latest statement date which are 
                    already billed to your card account) 
                    <LI>Total outstanding authorizations<BR>(This is the sum of 
                    all the transactions after the latest statement date which 
                    are authorised by you but are yet to be billed to your 
                    account. In case you have availed Cash-on-Call, it also 
                    includes the Cash-on-Call principal amount which is 
                    outstanding on your card account.) 
                    <LI>Reward Points balance - Last Statement<BR>(This shows 
                    the total rewards points you had accumulated till the latest 
                    statement date) 
                    <LI>Rewards Points balance - Current Points <BR>(This shows 
                    the total reward points you currently have in your card 
                    account) </LI></UL>
                  </TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=txt_body vAlign=top><BR><BR><BR><A 
                  name=33></A><STRONG>Are there any special benefits to me for 
                  using Credit Cards NetBanking?</STRONG><BR>Credit Cards 
                  NetBanking saves your time and provides you the convenience of 
                  transacting from your home without hassels. 
                 </TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=txt_body vAlign=top><BR><BR><BR><A 
                  name=36></A><STRONG>How can I de-register for the Credit Cards 
                  NetBanking service?</STRONG><BR>Please click on the 
                  de-register option on the left hand side panel and select the 
                  card number for discontinuing NetBanking facility for your 
                  card. 
                 </TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=txt_body vAlign=top><BR><BR><BR><A 
                  name=37></A><STRONG>How can I register for Credit Cards 
                  NetBanking if I don't have my Credit Card ATM PIN 
                  number?</STRONG><BR>You can call up your nearest Credit Cards 
                  customer service number to request for the generation of a new 
                  ATM PIN number. You can register for Credit Cards NetBanking 
                  once you get your new ATM PIN number <BR><BR>To find a Credit 
                  Cards customer service number,
				</TD></TR>
              <TR>
                <TD class=dotted_line1 vAlign=top></TD></TR>
              <TR>
                <TD class=txt_body vAlign=top><BR><BR><BR><A 
                  name=38></A><STRONG>What are the measures I can take to ensure 
                  greater security?</STRONG><BR><BR>
                  <UL type=square >
                    <LI>You should log-out from the NetBanking when leaving your 
                    PC. 
                    <LI>Always change your password periodically /continuously, choose 
                    "strong" 6 to 8 digit complex passwords (alphanumeric) and change 
                    them regularly; avoid obvious passwords (names of family 
                    members, pets, favourite musician etc), and don't reveal 
                    your passwords to anyone. 
                    <LI>You should not write a password down on any paper, which 
                    may be easily accessible to anyone. 
                    <LI>Put in a power-on password in your machine so that 
                    nobody else can switch on your machine. 
                    <LI>Have a screensaver password so that when you are away 
                    from your workstation nobody else can access it. 
                    <LI>If you think someone knows your password go online and 
                    change it immediately 
                    <LI>If you are using the Internet in a public place (e.g. a 
                    Cyber Cafe) do not leave the PC unattended, and ensure that 
                    no one is watching what you type. 
                    <LI>Logoff from NetBanking upon completion of your session. 
                    Use the Log-out button to Log out so that the session closes 
                    and don't shut the window to Log off. This will prevent the 
                    viewing of previous pages of your online session via your 
                    PC. 
                    <LI>You should consider running a Personal Firewall, which 
                    will prevent unauthorised persons from accessing your 
                    computer and guard against the introduction of malicious 
                    programs onto your PC. </LI></UL>
             

</table>
</td>
</tr>
</table>


<br>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>
<style>
.txt_body{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
}
</style>