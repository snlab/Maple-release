## pkt-json-str

The 'pkt' field of TraceTree history response is as follows.


```json

  "pkt": {
    "pkt-str": "MaplePacket [ingressPort=openflow:4:1, frame=\nip\ndl_vlan: untagged\ndl_vlan_pcp: 0\ndl_src: 46:53:e1:35:12:6f\ndl_dst: 32:49:3b:f1:88:7d\nnw_src: 10.0.0.2\nnw_dst: 10.0.0.1\nnw_tos: 0\nnw_proto: 6\ntcpsrc: 80\ntcpdst: 44396]",
    "pkt-hex": "32:49:3b:f1:88:7d:46:53:e1:35:12:6f:08:00:45:00:00:3c:00:00:40:00:40:06:26:ba:0a:00:00:02:0a:00:00:01:00:50:ad:6c:2e:85:0f:5b:47:82:86:5a:a0:12:71:20:88:25:00:00:02:04:05:b4:04:02:08:0a:00:1d:40:79:00:1d:40:79:01:03:03:09",
    "timestamp": "05-04-2017 09:43:15:043",
    "pkt-json-str": "{\"ingressPort\":\"openflow:4:1\",\"frame\":{\"payload\":{\"fragmentOffset\":\"0x0000\",\"IPv4_DST\":\"10.0.0.1\",\"IPv4_SRC\":\"10.0.0.2\",\"length\":\"0x05\",\"flags\":\"0x02\",\"version\":\"0x04\",\"diffServ\":\"0x00\",\"ttl\":\"0x40\",\"protocol\":\"0x06\",\"identification\":\"0x0000\",\"payload\":{\"sequence\":\"0x2e850f5b\",\"dataOffset\":\"0x0a\",\"windowSize\":\"0x7120\",\"srcip\":\"0x0000\",\"TCP_DST_PORT\":\"0xad6c\",\"acknowledge\":\"0x4782865a\",\"payload\":{\"data\":\"\"},\"flags\":\"0x0012\",\"checksum\":\"0x8825\",\"options\":\"0x020405b40402080a001d4079001d407901030309\",\"TCP_SRC_PORT\":\"0x0050\"},\"totallength\":\"0x003c\",\"checksum\":\"0x26ba\"},\"ETH_SRC\":\"46:53:E1:35:12:6F\",\"ETH_DST\":\"32:49:3B:F1:88:7D\",\"ETH_TYPE\":\"0x0800\"}}"
  },

```

The 'pkt-json-str' field can be parsed as JSON Object like this.

```js
var i=0;
function test(){
     $.ajax({  
         url: 'http://localhost:8181/restconf/operational/maple-tracetree-history:tracetreehistory/history/'+i+'/',
         type: 'GET',
         dataType: 'json',
         timeout: 1000,
         cache: false, 
         beforeSend: LoadFunction, 
         error: erryFunction,
         success: succFunction
     })
     function LoadFunction(xhr){
        xhr.setRequestHeader("Authorization", "Basic " + "YWRtaW46YWRtaW4=");  
     }
     function erryFunction(){ 
         alert("error");  
     }
     function succFunction(tt){
     	i++;
     	str=tt.history[0].pkt['pkt-json-str'];
     	t1=JSON.parse(str);
     	console.log(tt);
     	console.log(t1);
     }
}

```

the JSON Object is a hierarchical structure like this, all fields except 'ETH_DST', 'ETH_SRC', 'IPv4_DST' and 'IPv4_SRC' are encoded in hexadecimal.

![](pkt.png)





