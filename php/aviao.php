</!DOCTYPE html>
<html>
<head>
	<title>Felipe Airlines</title>
</head>
<style>

	::-webkit-input-placeholder { /* Chrome/Opera/Safari */
	  color: #999;
	}
	::-moz-placeholder { /* Firefox 19+ */
	  color: #999;
	}
	:-ms-input-placeholder { /* IE 10+ */
	  color: #999;
	}
	:-moz-placeholder { /* Firefox 18- */
	  color: #999;
	}
	
	html, body {
		margin: 0;
		padding: 0;
		height: 100%;
		width: 100%;
		background-color: #EEE;
		background-image: url("https://pt.best-wallpaper.net/wallpaper/1920x1080/1411/Aviation-aircraft-flight-sunrise-clouds-sky_1920x1080.jpg");
		overflow: hidden;
	}

	form {
		background-color: rgba(0,0,0,0.5);
		border-bottom: 1px solid rgba(0,0,0,0.7);
		padding: 20px;
		position: absolute;
		width: 300px;
		left: 50%;
		top: 50%;
		transform: translate(-50%, -50%);
	}

	form input {
		display: block;
		background-color: rgba(0,0,0,0.5);
		width: 100%;
		padding: 10px 15px;
		border: none;
		color: #FFF;
		text-shadow: 0 1px 0 rgba(0,0,0,0.3);
		border-bottom: 1px solid rgba(0,0,0,0.6);
		transition: all 0.5s;
		cursor: pointer;
	}

	form input:hover {
		background-color: rgba(0,0,0,0.4);
	}

	form input + input {
		margin-top: 10px;
	}

	form input[type="submit"] {
		background-color: #F90;
	}

	form input[type="submit"]:hover {
		background-color: #FA1;
	}

	form input[type="reset"] {
		background-color: rgba(255,255,255,0.2);
	}

	form input[type="reset"]:hover {
		background-color: rgba(255,255,255,0.3);
	}

	form a {
		text-decoration: none;
		font-family: sans-serif;
		font-size: 12px;
		color: #FFF;
		display: block;
		text-align: right;
		padding-top: 10px;
		text-shadow: 0 1px 0 rgba(0,0,0,0.3);
	}

	form a:hover {
		text-decoration: underline;
	}
	form h1 {
		margin: 0;
		padding: 0;
		font-family: sans-serif;
		text-transform: uppercase;
		position: absolute;
		top: -60px;
		color: #FFF;
		font-size: 50px;
		text-shadow: 0 2px 0 rgba(0,0,0,0.3);
		text-align: center;
	}

	#filipe {
		font-size: 300px;
		font-family: sans-serif;
		text-transform: uppercase;
		position: absolute;
		line-break: unset;
		white-space: nowrap;
		margin: 0;
		padding: 0;
		color: rgba(255,255,255,0.3);
		animation-name: title;
		animation-duration: 50s;
		animation-direction: alternate;
		animation-iteration-count: infinite;
		-webkit-touch-callout: none; /* iOS Safari */
        -webkit-user-select: none; /* Safari */
        -khtml-user-select: none; /* Konqueror HTML */
        -moz-user-select: none; /* Firefox */
        -ms-user-select: none; /* Internet Explorer/Edge */
        user-select: none;
        cursor: initial;
	}

	@keyframes title {
		0% {
			transform: translateX(100%);
		}
		100% {
			transform: translateX(-100%);
		}
	}

</style>
</style>
<body>
<h1 id="filipe">Felipinho Linhas Aéreas</h1>
		<div>
		<form action="cadastroaviao.php" method="POST">
		<form>
			<h1>Avião</h1>
			<input type="text" placeholder="nome_aviao" name="nome_aviao">
			<input type="text" placeholder="num_poltronas" name="num_poltronas">
			<input type="submit" value="Cadastrar Avião"><input type="reset" value="Limpar">
			<a href="index.php"><input type="button" value="Voltar"></a>
		</form>
	</div>
</body>
</html>