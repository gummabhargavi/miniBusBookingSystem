<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Document</title>
   <script type="text/javascript">

   // Get the Interval ID
 var setInterval_ID = setInterval(my_alert_func, 2000);

 function my_alert_func()
 {
   alert('I am an alert message appear in every 3 seconds');
 }

   // Set timeout to call stop_interval function after 12 seconds
   setTimeout(stop_interval, 12000);

   function stop_interval()
   {
     clearInterval(setInterval_ID);
   }
   </script>
</head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<body>

</html>