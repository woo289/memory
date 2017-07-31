<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
<link
href="https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=AIzaSyDs-T1EEykIfdXaJaB5ML6HYsddRZ5BD4U"/>

<style type="text/css">
#map{
height: 400px;
width: 100%;
}
</style>

</head>
<body>
<div>
	<input type="text" id="addr" name="addr">
	<button type="button" id="ok" name="ok">확인</button>
</div>
<div id="message"></div>

<div id="map"></div>
<p id="lat"></p>
<p id="lng"></p>
<script type="text/javascript" src="/qqu/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/qqu/resources/js/jquery-3.2.1.js"></script>

<!-- <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?"></script> --> 
<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>



<script type="text/javascript">

$(function() {
		var lat;
		var lng;
		$("#ok").click(function googleapisView() {
			
			var address = encodeURIComponent($("#addr").val());
			var geocode = "http://maps.googleapis.com/maps/api/geocode/json?address=" + address + "&sensor=false";
			jQuery.ajax({
				url : geocode,
				type : 'POST',
				success : function(myJSONResult) {
					if (myJSONResult.status == 'OK') {
						var tag = "";
						var i;
						for (i = 0; i < myJSONResult.results.length; i++) {
							tag += "주소 : " + myJSONResult.results[i].formatted_address + " <br />";
							lat = myJSONResult.results[i].geometry.location.lat;
							lng = myJSONResult.results[i].geometry.location.lng;
							tag += "위도 : " + lat + " <br />";
							tag += "경도 : " + lng + " <br />";
							$("#lat").text(lat);
							$("#lng").text(lng);
						}
						document.getElementById("message").innerHTML = tag;
					} else if (myJSONResult.status == 'ZERO_RESULTS') {
						alert("지오코딩이 성공했지만 반환된 결과가 없음을 나타냅니다.\n\n이는 지오코딩이 존재하지 않는 address 또는 원격 지역의 latlng을 전달받는 경우 발생할 수 있습니다.")
					} else if (myJSONResult.status == 'OVER_QUERY_LIMIT') {
						alert("할당량이 초과되었습니다.");
					} else if (myJSONResult.status == 'REQUEST_DENIED') {
						alert("요청이 거부되었습니다.\n\n대부분의 경우 sensor 매개변수가 없기 때문입니다.");
					} else if (myJSONResult.status == 'INVALID_REQUEST') {
						alert("일반적으로 쿼리(address 또는 latlng)가 누락되었음을 나타냅니다.");
					}
				}
			});
		});
	googleapisView();
	
});	
</script>
<script type="text/javascript">
$(function(){
	

	//현재 위치에서 위도/경도 뽑기
	function getLocation_cord(){
		if (navigator.geolocation)
		{
			navigator.geolocation.getCurrentPosition(initmap,errorCallback);
		} else
		{
			$("#map").html("Geolocation is not supported by this browser.");
			alert('단말기에서 현재 위치를 사용할 수 없습니다.');
		}
	}  

	var locations = [];
	var images = [];
	var names = [];
	var markers = [];
	var int = 0;
	var map;
	
	// 마커 이름
	names[0] = "제주공항";
	names[1] = "마라도";
	
	//마커 위치
	locations[0] = new google.maps.LatLng(33.51041350000001,126.4913534);
	locations[1] = new google.maps.LatLng(33.121192, 126.266926);
	
	//마커 이미지
	
	images[0] = "https://lh3.googleusercontent.com/proxy/VMeuFv2bx0hp_bjzcTwl1T4hv1kmZRn8VucD6CInw-S6XR1T_2oCoOEoiuEVp-lAT1cugvC8cRPvU8OKZGwlmQayG2IMp7DBO3Evucu5v__SB2tqFDy3Th2mxrYBPgWBDE2vHtf4UXp5eO_awwIX3iejKVjVoNE=w357-h200-k-no";
	images[1] = "data:image/jpeg;base64,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";
	
	
	
	function initmap(){
	var jejumap = 'http://postfiles4.naver.net/MjAxNzA3MjhfMTIy/MDAxNTAxMjI2Nzg2MDU5.j35rwveKGP9q-wKCSiNnGqwnDBkCITJu63cf-5cynjog.NsZXF_ubFuCaUhoJM4jn-BoaTKULbbn5sd7np1SAQjYg.PNG.rhddbgkqtlek/jejuisland.png?type=w2';
	var icon = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';
		//좌표 이미지를 표시하는 MarkerImage
		//마커 이미지는 경로 이미지 지정으로 쓰면 못찾음. 인터넷 페이지로 등록된 이미지만 사용가능.
		var GreenIcon = new google.maps.MarkerImage(
			"http://postfiles5.naver.net/MjAxNzA3MjhfMTY4/MDAxNTAxMjExMTQ1MTU2.JkY7TuAMlSUccrKSAryki18LKTTtfVSh1542VC22RB4g.3M97kkvxmFHNhlEm_yOmKXVG8CMQO8VI1XayjVBN1ncg.JPEG.rhddbgkqtlek/sibadog.jpg?type=w2",
			new google.maps.Size(60, 60),
			new google.maps.Point(0, 0),
			new google.maps.Point(6, 20), 
			new google.maps.Size(20,35));
	
		
		//위도 경도 표시
		var lat = $("#lat").val();
		var lng = $("#lng").val();
		alert(lat+"  "+lng);
		var infowindow = new google.maps.InfoWindow();
		var wplatlng = new google.maps.LatLng(33.2541205 , 126.560076 );
		var wpOptions = {
			zoom:15,				// 지도 zoom단계
			center:wplatlng,		//지도에서 가운데로 위치할 위도와 경도(변수) 
			mapTypeId:google.maps.MapTypeId.ROADMAP 
			}; 
		var wpmap = new google.maps.Map(document.getElementById('map'),wpOptions);
		

		/* var marker = new google.maps.Marker({
			position: wplatlng,				// 마커 표시 좌표.
			icon: GreenIcon,				// 마커로 사용할 이미지(변수)
			map: wpmap, 
			info: "말풍선",				// 말풍선 안에 들어갈 내용.
			title : "현재위치",				// 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀.
			
			}); */
		for (var i = 0; i < locations.length; i++) {
		    addMarker(wpmap);
		  } 
   		}
	 function addMarker(wpmap){
		var marker = new google.maps.Marker({
		    position: locations[int],
		    map: wpmap,
		    draggable: false,
		    icon: images[int]
		  });
		markers.push(marker);
		var infowindow = new google.maps.InfoWindow({
		      content: names[int]
		  });
		 
		  google.maps.event.addListener(marker, 'click', function() {
		    infowindow.open(map,marker);
		  });
		  int++;
		
	} 
	
	 //위도 경도 실패시
	function errorCallback(wp_position_error) 
	{	
		// 실패 코드와 메세지 출력
		$("#map").html("error.code : "+ wp_position_error.code + " , error.message : " + wp_position_error.message);
	}
	
	google.maps.event.addDomListener(window, 'load', initmap); 
});
</script>

<script async defer 
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC7ZyUiCX5vn1s_qYdk0utPw1bsRuk4jmg&callback=initmap"></script>
</body>
</html>