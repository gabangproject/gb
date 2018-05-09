<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Guardian &mdash; 100% Free Fully Responsive HTML5
	Template by FREEHTML5.co</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />

<!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FREEHTML5.CO
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico">

<link
	href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700,300'
	rel='stylesheet' type='text/css'>

<!-- Animate.css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- Superfish -->
<link rel="stylesheet" href="css/superfish.css">

<link rel="stylesheet" href="css/style.css">


<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

<!-- 매물등록 관련 bootstrap -->
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- 매물등록 관련 bootstrap 끝 -->


</head>
<body>
	<div id="fh5co-wrapper">
		<div id="fh5co-page">


			<!-- header 시작  -->

			<jsp:include page="header.jsp" />
			<!-- header 끝 -->


			<div class="fh5co-hero fh5co-hero-2">
				<div class="fh5co-overlay"></div>
				<div class="fh5co-cover fh5co-cover_2 text-center"
					data-stellar-background-ratio="0.5"
					style="background-image: url(images/blog-3.jpg);">
					<div class="desc animate-box">
						<h2>Contact Us</h2>
						<span>Lovely Crafted by <a href="http://frehtml5.co/"
							target="_blank" class="fh5co-site-name">FREEHTML5.co</a></span>
					</div>
				</div>
			</div>
			<!-- end:header-top -->

			<!-- 매물 등록 폼 -->
			<form class="form-horizontal">
				<fieldset>

					<!-- Form Name -->
					<legend>Sign Up</legend>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="firstname">보증금</label>
						<div class="col-md-4">
							<input id="firstname" name="firstname" type="text"
								placeholder="first name" class="form-control input-md">
							<span class="help-block">Enter First Name</span>
						</div>
					</div>


					<!-- Multiple Radios -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="radios">거래형태</label>
						<div class="col-md-4">
							<div class="radio">
								<label for="radios-0"> <input type="radio" name="radios"
									id="radios-0" value="1" checked="checked"> 전세
								</label>
							</div>
							<div class="radio">
								<label for="radios-1"> <input type="radio" name="radios"
									id="radios-1" value="2"> 월세
								</label>
							</div>
							<div class="radio">
								<label for="radios-2"> <input type="radio" name="radios"
									id="radios-2" value="3"> 기타
								</label>
							</div>
						</div>
					</div>

					<!-- Multiple Radios -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="radios">주거형태</label>
						<div class="col-md-4">
							<div class="radio">
								<label for="radios-0"> <input type="radio" name="radios"
									id="radios-0" value="1" checked="checked"> 원룸
								</label>
							</div>
							<div class="radio">
								<label for="radios-1"> <input type="radio" name="radios"
									id="radios-1" value="2"> 투룸
								</label>
							</div>
							<div class="radio">
								<label for="radios-2"> <input type="radio" name="radios"
									id="radios-2" value="3"> 주택
								</label>
							</div>
							<div class="radio">
								<label for="radios-3"> <input type="radio" name="radios"
									id="radios-3" value="4"> 오피스텔
								</label>
							</div>
						</div>
					</div>



					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="mobno">관리비</label>
						<div class="col-md-4">
							<input id="mobno" name="mobno" type="text"
								placeholder="mobile number" class="form-control input-md">
							<span class="help-block">Enter Mobile Number</span>
						</div>
					</div>

					<!-- Multiple Radios -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="radios">엘리베이터</label>
						<div class="col-md-4">
							<div class="radio">
								<label for="radios-0"> <input type="radio" name="radios"
									id="radios-0" value="1" checked="checked"> 있음
								</label> <label for="radios-1"> <input type="radio"
									name="radios" id="radios-1" value="2"> 없음
								</label>
							</div>

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="emailid">Email
							Id</label>
						<div class="col-md-4">
							<input id="emailid" name="emailid" type="text"
								placeholder="email id" class="form-control input-md"> <span
								class="help-block">Enter Email Id</span>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="address1">Address
							Line 1</label>
						<div class="col-md-4">
							<input id="address1" name="address1" type="text"
								placeholder="address line 1" class="form-control input-md">
							<span class="help-block">Enter Address Line 1</span>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="address2">Address
							Line 2</label>
						<div class="col-md-4">
							<input id="address2" name="address2" type="text"
								placeholder="address line 2" class="form-control input-md">
							<span class="help-block">Enter Address Line 2</span>
						</div>
					</div>

					<!-- Select Multiple -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="City">건물층</label>
						<div class="col-md-4">
							<select id="City" name="City" class="form-control"
								multiple="multiple">

								<%
									for (int i = 0; i <= 100; i++) {
								%>
								<option value="<%=i%>"><%=i + "층"%></option>
								<%
									}
								%>

							</select>
						</div>
					</div>

					<!-- Select Multiple -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="state">State</label>
						<div class="col-md-4">
							<select id="state" name="state" class="form-control"
								multiple="multiple">
								<option value="1">Option one</option>
								<option value="2">Option two</option>
							</select>
						</div>
					</div>

					<!-- Select Multiple -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="postbox">Post
							Box Number</label>
						<div class="col-md-4">
							<select id="postbox" name="postbox" class="form-control"
								multiple="multiple">
								<option value="1">Option one</option>
								<option value="2">Option two</option>
							</select>
						</div>
					</div>

					<!-- Select Multiple -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="country">Country</label>
						<div class="col-md-4">
							<select id="country" name="country" class="form-control"
								multiple="multiple">
								<option value="1">Afghanistan</option>
								<option value="2">Albania</option>
								<option value="3">Algeria</option>
								<option value="4">Andorra</option>
								<option value="5">Angola</option>
								<option value="6">Anguilla</option>
								<option value="7">Antigua & Barbuda</option>
								<option value="8">Argentina</option>
								<option value="9">Armenia</option>
								<option value="10">Australia</option>
								<option value="11">Austria</option>
								<option value="12">Azerbaijan</option>
								<option value="13">Bahamas</option>
								<option value="14">Bahrain</option>
								<option value="15">Bangladesh</option>
								<option value="16">Barbados</option>
								<option value="17">Belarus</option>
								<option value="18">Belgium</option>
								<option value="19">Belize</option>
								<option value="20">Benin</option>
								<option value="21">Bermuda</option>
								<option value="22">Bhutan</option>
								<option value="23">Bolivia</option>
								<option value="24">Bosnia & Herzegovina</option>
								<option value="25">Botswana</option>
								<option value="26">Brazil</option>
								<option value="27">Brunei Darussalam</option>
								<option value="28">Bulgaria</option>
								<option value="29">Burkina Faso</option>
								<option value="30">Myanmar/Burma</option>
								<option value="31">Burundi</option>
								<option value="32">Cambodia</option>
								<option value="33">Cameroon</option>
								<option value="34">Canada</option>
								<option value="35">Cape Verde</option>
								<option value="36">Cayman Islands</option>
								<option value="37">Central African Republic</option>
								<option value="38">Chad</option>
								<option value="39">Chile</option>
								<option value="40">China</option>
								<option value="41">Colombia</option>
								<option value="42">Comoros</option>
								<option value="43">Congo</option>
								<option value="44">Costa Rica</option>
								<option value="45">Croatia</option>
								<option value="46">Cuba</option>
								<option value="47">Cyprus</option>
								<option value="48">Czech Republic</option>
								<option value="49">Democratic Republic of the Congo</option>
								<option value="50">Denmark</option>
								<option value="51">Djibouti</option>
								<option value="52">Dominican Republic</option>
								<option value="53">Dominica</option>
								<option value="54">Ecuador</option>
								<option value="55">Egypt</option>
								<option value="56">El Salvador</option>
								<option value="57">Equatorial Guinea</option>
								<option value="58">Eritrea</option>
								<option value="59">Estonia</option>
								<option value="60">Ethiopia</option>
								<option value="61">Fiji</option>
								<option value="62">Finland</option>
								<option value="63">France</option>
								<option value="64">French Guiana</option>
								<option value="65">Gabon</option>
								<option value="66">Gambia</option>
								<option value="67">Georgia</option>
								<option value="68">Germany</option>
								<option value="69">Ghana</option>
								<option value="70">Great Britain</option>
								<option value="71">Greece</option>
								<option value="72">Grenada</option>
								<option value="73">Guadeloupe</option>
								<option value="74">Guatemala</option>
								<option value="75">Guinea</option>
								<option value="76">Guinea-Bissau</option>
								<option value="77">Guyana</option>
								<option value="78">Haiti</option>
								<option value="79">Honduras</option>
								<option value="80">Hungary</option>
								<option value="81">Iceland</option>
								<option value="82">India</option>
								<option value="83">Indonesia</option>
								<option value="84">Iran</option>
								<option value="85">Iraq</option>
								<option value="86">Israel and the Occupied Territories</option>
								<option value="87">Italy</option>
								<option value="88">Ivory Coast (Cote d'Ivoire)</option>
								<option value="89">Jamaica</option>
								<option value="90">Japan</option>
								<option value="91">Jordan</option>
								<option value="92">Kazakhstan</option>
								<option value="93">Kenya</option>
								<option value="94">Kosovo</option>
								<option value="95">Kuwait</option>
								<option value="96">Kyrgyz Republic (Kyrgyzstan)</option>
								<option value="97">Laos</option>
								<option value="98">Latvia</option>
								<option value="99">Lebanon</option>
								<option value="100">Lesotho</option>
								<option value="101">Liberia</option>
								<option value="102">Libya</option>
								<option value="103">Liechtenstein</option>
								<option value="104">Lithuania</option>
								<option value="105">Luxembourg</option>
								<option value="106">Republic of Macedonia</option>
								<option value="107">Madagascar</option>
								<option value="108">Malawi</option>
								<option value="109">Malaysia</option>
								<option value="110">Maldives</option>
								<option value="111">Mali</option>
								<option value="112">Malta</option>
								<option value="113">Martinique</option>
								<option value="114">Mauritania</option>
								<option value="115">Mauritius</option>
								<option value="116">Mayotte</option>
								<option value="117">Mexico</option>
								<option value="118">Moldova, Republic of</option>
								<option value="119">Monaco</option>
								<option value="120">Mongolia</option>
								<option value="121">Montenegro</option>
								<option value="122">Montserrat</option>
								<option value="123">Morocco</option>
								<option value="124">Mozambique</option>
								<option value="125">Namibia</option>
								<option value="126">Nepal</option>
								<option value="127">Netherlands</option>
								<option value="128">New Zealand</option>
								<option value="129">Nicaragua</option>
								<option value="130">Niger</option>
								<option value="131">Nigeria</option>
								<option value="132">Korea, Democratic Republic of
									(North Korea)</option>
								<option value="133">Norway</option>
								<option value="134">Oman</option>
								<option value="135">Pacific Islands</option>
								<option value="136">Pakistan</option>
								<option value="137">Panama</option>
								<option value="138">Papua New Guinea</option>
								<option value="139">Paraguay</option>
								<option value="140">Peru</option>
								<option value="141">Philippines</option>
								<option value="142">Poland</option>
								<option value="143">Portugal</option>
								<option value="144">Puerto Rico</option>
								<option value="145">Qatar</option>
								<option value="146">Reunion</option>
								<option value="147">Romania</option>
								<option value="148">Russian Federation</option>
								<option value="149">Rwanda</option>
								<option value="150">Saint Kitts and Nevis</option>
								<option value="151">Saint Lucia</option>
								<option value="152">Saint Vincent's & Grenadines</option>
								<option value="153">Samoa</option>
								<option value="154">Sao Tome and Principe</option>
								<option value="155">Saudi Arabia</option>
								<option value="156">Senegal</option>
								<option value="157">Serbia</option>
								<option value="158">Seychelles</option>
								<option value="159">Sierra Leone</option>
								<option value="160">Singapore</option>
								<option value="161">Slovak Republic (Slovakia)</option>
								<option value="162">Slovenia</option>
								<option value="163">Solomon Islands</option>
								<option value="164">Somalia</option>
								<option value="165">South Africa</option>
								<option value="166">Korea, Republic of (South Korea)</option>
								<option value="167">South Sudan</option>
								<option value="168">Spain</option>
								<option value="169">Sri Lanka</option>
								<option value="170">Sudan</option>
								<option value="171">Suriname</option>
								<option value="172">Swaziland</option>
								<option value="173">Sweden</option>
								<option value="174">Switzerland</option>
								<option value="175">Syria</option>
								<option value="176">Tajikistan</option>
								<option value="177">Tanzania</option>
								<option value="178">Thailand</option>
								<option value="179">Timor Leste</option>
								<option value="180">Togo</option>
								<option value="181">Trinidad & Tobago</option>
								<option value="182">Tunisia</option>
								<option value="183">Turkey</option>
								<option value="184">Turkmenistan</option>
								<option value="185">Turks & Caicos Islands</option>
								<option value="186">Uganda</option>
								<option value="187">Ukraine</option>
								<option value="188">United Arab Emirates</option>
								<option value="189">United States of America (USA)</option>
								<option value="190">Uruguay</option>
								<option value="191">Uzbekistan</option>
								<option value="192">Venezuela</option>
								<option value="193">Vietnam</option>
								<option value="194">Virgin Islands (UK)</option>
								<option value="195">Virgin Islands (US)</option>
								<option value="196">Yemen</option>
								<option value="197">Zambia</option>
								<option value="198">Zimbabwe</option>
							</select>
						</div>
					</div>

					<!-- Button -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="otp">Generate
							OTP</label>
						<div class="col-md-4">
							<button id="otp" name="otp" class="btn btn-primary">Generate
								OTP</button>
						</div>
					</div>

					<!-- Button -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="login">등록 확인</label>
						<div class="col-md-4">
							<button id="login" name="login" class="btn btn-primary">등록</button>
							<button id="login" name="login" class="btn btn-primary">취소</button>
						</div>
					</div>

				</fieldset>
			</form>
			<!-- 매물 등록 폼 끝 -->
			<!-- END fh5co-contact -->

			<!-- END map -->


			<jsp:include page="footer.jsp" />


		</div>
		<!-- END fh5co-page -->

	</div>
	<!-- END fh5co-wrapper -->

	<!-- jQuery -->


	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Stellar -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Superfish -->
	<script src="js/hoverIntent.js"></script>
	<script src="js/superfish.js"></script>
	<!-- Google Map -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
	<script src="js/google_map.js"></script>
	<!-- Main JS (Do not remove) -->
	<script src="js/main.js"></script>

</body>
</html>

