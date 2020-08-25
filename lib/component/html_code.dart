class MyHtmlCode {
  String transfer(){
    return """
      <h2>This API for Bank</h2>
      <ul>
        <li>BRI</li>
        <li>BNI</li>
        <li>BCA</li>
        <li>MANDIRI</li>
      </ul>

      <br>

      <h2>To transfer same Bank</h2>
      <samp>How to run the automation tranfer?, to run this API you just need to send the body JSON to url with method POST:</samp><br>
      <samp><a>http://192.168.1.52:9003/transfer/publish</a></samp><br>
      <samp>With data example like this: </samp><br>
      <code>
        <samp>{</samp><br>
          <samp>    "bank": "bank name",</samp><br>
          <samp>    "username": "username",</samp><br>
          <samp>    "mpin": "mpin",</samp><br>
          <samp>    "rekening": "account number",</samp><br>
          <samp>    "nominal": 10000,</samp><br>
          <samp>    "password": "password",</samp><br>
          <samp>    "udid": "devices id",</samp><br>
          <samp>    "port": 8200</samp><br>
        <samp> }</samp><br>
      </code>

      <samp>
        <p>Description: </p>
        <p>bank       : Input this with bank name but only using lowercase | required</p>
        <p>username   : Input username for login in account bank | required</p>
        <p>mpin       : Input this with PIN Mobile banking if it needed in sometime mpin is needed to login</p>
        <p>rekening   : Input this with the account bank | required </p>
        <p>nominal    : Input this with how much money will send | required</p>
        <p>password   : Input this with password to login in account bank | required </p>
        <p>udid       : Input this with devices ID | required </p>
        <p>port       : Input port if needed, recommanded stay with 8200 </p>
      </samp>
      
      <br><br>
      <h2>Show all Transaction</h2><br>
      <samp>to show all transaction use route path with method GET:</samp><br>
      <samp><a>http://192.168.1.52:9002/transfer/list</a></samp><br>

      <h2>Show single transaction</h2></br>
      <samp>to show just a single transaction, use route path with method GET:</samp><br>
      <samp><a>http://192.168.1.52:9002/tb/getone/uniqueid</a></samp><br>
      <samp>ex. uniqueid = c3c5ccc8-336d-4458-9b5a-8df22e2465a6</samp><br>
    """;
  }

  String mutasi(){
    return """
      <h2>This API for Bank</h2>
      <ul>
        <li>BRI (Under Development)</li>
        <li>BNI (Under Development)</li>
        <li>BCA (Under Development)</li>
        <li>MANDIRI (Under Development)</li>
      </ul><br>

      <h2>Run automation Mutasi</h2>
      <samp>How to run automation mutation?, to run this, send the body JSON and use route path with method POST:</samp><br>
      <samp><a>http://192.168.1.52:9003/mutasi/publish</a></samp><br>
      <samp>With data like this: </samp><br>
      <code>
        <samp>{</samp><br>
          <samp>    "bank": "bank name",</samp><br>
          <samp>    "username": "username",</samp><br>
          <samp>    "password": "passord",</samp><br>
          <samp>    "mpin": "mpin",</samp><br>
          <samp>    "udid": "devices id",</samp><br>
          <samp>    "port": 8200</samp><br>
        <samp> }</samp><br>
      </code>

      <samp>
        <p>Description: </p>
        <p>bank       : Input this with bank name but only using lowercase | required</p>
        <p>username   : Input username for login in account bank | required</p>
        <p>password   : Input this with password to login in account bank | required </p>
        <p>mpin       : Input this with PIN Mobile banking if it needed in sometime mpin is needed to login</p>
        <p>udid       : Input this with devices ID | required </p>
        <p>port       : Input port if needed, recommanded stay with 8200 </p>
      </samp>

      <h2>Show all transaction mutation</h2>
      <samp>to show all transaction use route path with method GET:</samp><br>
      <samp><a>http://192.168.1.52:9002/mt</a></samp><br>
    """;
  }

  String devices(){
    return """
      <h2>This API for get all devices</h2>
      <samp>To get this please use route path with method GET:</samp><br>
      <samp><a>http://192.168.1.52:8081/check</a></samp><br>
    """;
  }
}