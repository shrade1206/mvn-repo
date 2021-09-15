
<script type="text/javascript"
		src="${pageContext.servletContext.contextPath }/js/login.js"></script>



$(function() {
	// Your web app's Firebase configuration
	// For Firebase JS SDK v7.20.0 and later, measurementId is optional
	let firebaseConfig = {
		apiKey: "AIzaSyCZud6389peJs9Ns2gWNbgbPWuAd3d1p6o",
		authDomain: "fendishabu-c6e6d.firebaseapp.com",
		databaseURL: "https://fendishabu-c6e6d-default-rtdb.firebaseio.com",
		projectId: "fendishabu-c6e6d",
		storageBucket: "fendishabu-c6e6d.appspot.com",
		messagingSenderId: "215823760498",
		appId: "1:215823760498:web:e44e3ea9c96182a1b316eb",
		measurementId: "G-4L3K47YRJ0"
	};
	// Initialize Firebase
	let a = firebase.initializeApp(firebaseConfig);
	console.log("Initialized");
	console.log(a);
	firebase.analytics();

	//SignIn
	let btnIn = document.getElementById("btnSignIn");

	btnIn.onclick = function() {
		let emailIn = $("#emailIn").val();
		let passwordIn = $("#passwordIn").val();


		firebase.auth()
			.signInWithEmailAndPassword(emailIn, passwordIn)
			.then(result => {
				console.log(result);
				firebase.auth().onAuthStateChanged(function(user) {
					if (user) {
						// 使用者已登入，可以取得資料
						var email = user.email;
						var uid = user.uid;
						console.log(email, uid);
						Cookies.set("uid", uid);
						console.log(email + " " + uid);
						window.location.href = "/shabushabu/pages/login.controller";
					} else {
						// 使用者未登入
					}
				});

			})
			.catch(error => {
				console.log(error.message);
			});

	}




	//SignUp
	let btn = document.getElementById('btnSignUp');

	btn.onclick = function() {
		let email = $('#email').val();
		let password = $('#password').val();
		let moblie = $("#mobile").val(); //displayName
		const rex= /^09\d{8}$/;
		if(!rex.test($("#mobile").val())){
			$("#mobile").val().siblings("span").text("請輸入正確格式").css("color","red");
		}else{
			$("#mobile").val().siblings("span").text("v").css("color","green");
		}

		firebase
			.auth()
			.createuserWithEmailAndPassword(email, password,)
			.then(result => {
				console.log("註冊");
				console.log(result);
				let user = firebase.auth().currentuser;
				//EmailAuth
				user
					.sendEmailVerification()
					.then(function() {
						// 驗證信發送完成
						window.alert('驗證信已發送到您的信箱，請點選連結驗證。')
					}).catch(error => {
						// 驗證信發送失敗
						console.log(error.message);
					});
			}).catch(function(error) {
				console.log(error.message)
			});
	}

	//SignOut
	let btnOut = document.getElementById("btnSignOut")

	btnOut.onclick = function() {
		firebase.auth().signOut()
			.then(function() {
				alert('您已登出');
				let user = firebase.auth().currentuser;
				Cookies.remove("uid");
				console.log(user);
				// 登出後強制重整一次頁面
				window.location.reload();
			}).catch(function(error) {
				console.log(error.message)
			});
	}

	//Delete
	let btnDelete = document.getElementById('btnDelete');
	btnDelete.onclick = function() {
		let user = firebase.auth().currentuser;
		user.delete().then(function() {
			alert('帳號已刪除')
		})
	}

	//Google
	let provider = new firebase.auth.GoogleAuthProvider();

	let btnGooglePopup = document.getElementById('#googleSignUpPopup');
	$("#googleSignUpPopup").on("click", function() {
		firebase.auth().signInWithPopup(provider).then(function(result) {
			// 可以獲得 Google 提供 token，token可透過 Google API 獲得其他數據。  
			let token = result.credential.accessToken;
			let user = result.user;
			let userIn = firebase.auth().currentuser;
			if (userIn) {
				// user is signed in.
				let email = user.email;
				let uid = user.uid;
				Cookies.set("uid", uid);
				alert('登入成功')
			} else {
				// No user is signed in.
			}
		})
	})


	//Facebook
	let providerF = new firebase.auth.FacebookAuthProvider();

	let btnFacebookPopup = document.getElementById('facebookSignUpPopup');

	btnFacebookPopup.onclick = function() {
		firebase.auth().signInWithPopup(providerF).then(function(result) {
			let token = result.credential.accessToken;
			let user = result.user;
			let userIn = firebase.auth().currentuser;
			if (userIn) {
				// user is signed in.
				alert('登入成功')
			} else {
				// No user is signed in.
			}
		})
	}




	//忘記密碼
	const btnuserForgotSure = document.getElementById('sure-forgot');
	btnuserForgotSure.addEventListener('click', e => {
		const emailAddress = document.getElementById('new-forgot').value;
		const auth = firebase.auth();
		firebase.auth().languageCode = 'zh-TW'; // 發信模版改中文

		auth.sendPasswordResetEmail(emailAddress).then(() => {
			window.alert('已發送信件至信箱，請按照信件說明重設密碼');
			window.location.reload();
		}).catch(error => {
			changeErrMessage(error.message)
		});
	})

	//修改密碼
	let btnChangePassword = document.getElementById("sure-password");
	btnChangePassword.addEventListener('click', e => {
		function reAuth(checkPassword) {
			return new Promise(function(resolve, reject) {
				let user = firebase.auth().currentuser;
				let password = document.getElementById(checkPassword).value;
				let credential = firebase.auth.EmailAuthProvider.credential(user.email, password);
				user.reauthenticateWithCredential(credential).then(function() {
					resolve(user)
				}).catch(function(error) {
					reject(error.message);
				});
			})
		}

		// 取得新密碼
		let newPassword = document.getElementById('new-password').value;

		// 更新密碼
		reAuth('old-password')
			.then(function(user) {
				user.updatePassword(newPassword).then(function() {
					window.alert('密碼更新完成，請重新登入');

					// 修改密碼完成後，強制登出並重整一次頁面
					firebase.auth().signOut().then(function() {
						window.location.reload();
					});

				}).catch(function(error) {
					console.log(error.message)
				});
			}).catch(function(error) {
				console.log(error.message)
			});
	})
})