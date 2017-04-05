## TraceTree API

RESTful API

GET  http://localhost:8181/restconf/config/maple-tracetree:tracetree/

> Example Response

```json
{
  "tracetree": {
    "ttnode": [
      {
        "id": "6",
        "type": "V",
        "maple-v-type:field": "IPv4_DST"
      },
      {
        "id": "7",
        "type": "L",
        "maple-l-type:link": [
          {
            "link-id": "openflow:3:3",
            "src-node": {
              "port": "openflow:3:3",
              "node-id": "openflow:3"
            },
            "dst-node": {
              "port": "openflow:0:0",
              "node-id": "openflow:0"
            }
          },
          {
            "link-id": "openflow:1:1",
            "src-node": {
              "port": "openflow:1:1",
              "node-id": "openflow:1"
            },
            "dst-node": {
              "port": "openflow:0:0",
              "node-id": "openflow:0"
            }
          },
          {
            "link-id": "openflow:2:1",
            "src-node": {
              "port": "openflow:2:1",
              "node-id": "openflow:2"
            },
            "dst-node": {
              "port": "openflow:0:0",
              "node-id": "openflow:0"
            }
          }
        ],
        "maple-l-type:action-type": "Path"
      },
      {
        "id": "2",
        "type": "V",
        "maple-v-type:field": "IPv4_DST"
      },
      {
        "id": "3",
        "type": "L",
        "maple-l-type:link": [
          {
            "link-id": "openflow:2:3",
            "src-node": {
              "port": "openflow:2:3",
              "node-id": "openflow:2"
            },
            "dst-node": {
              "port": "openflow:0:0",
              "node-id": "openflow:0"
            }
          },
          {
            "link-id": "openflow:3:1",
            "src-node": {
              "port": "openflow:3:1",
              "node-id": "openflow:3"
            },
            "dst-node": {
              "port": "openflow:0:0",
              "node-id": "openflow:0"
            }
          },
          {
            "link-id": "openflow:1:2",
            "src-node": {
              "port": "openflow:1:2",
              "node-id": "openflow:1"
            },
            "dst-node": {
              "port": "openflow:0:0",
              "node-id": "openflow:0"
            }
          }
        ],
        "maple-l-type:action-type": "Path"
      },
      {
        "id": "0",
        "type": "V",
        "maple-v-type:field": "ETH_TYPE"
      },
      {
        "id": "11",
        "type": "L",
        "maple-l-type:action-type": "Flood"
      },
      {
        "id": "1",
        "type": "V",
        "maple-v-type:field": "IPv4_SRC"
      }
    ],
    "ttlink": [
      {
        "id": "4",
        "destination-id": "3",
        "condition": "10.0.0.3",
        "predicate-id": "2"
      },
      {
        "id": "5",
        "destination-id": "2",
        "condition": "10.0.0.1",
        "predicate-id": "1"
      },
      {
        "id": "10",
        "destination-id": "1",
        "condition": "IPv4",
        "predicate-id": "0"
      },
      {
        "id": "8",
        "destination-id": "7",
        "condition": "10.0.0.1",
        "predicate-id": "6"
      },
      {
        "id": "9",
        "destination-id": "6",
        "condition": "10.0.0.3",
        "predicate-id": "1"
      },
      {
        "id": "12",
        "destination-id": "11",
        "condition": "ARP",
        "predicate-id": "0"
      }
    ]
  }
}

````


GET http://localhost:8181/restconf/operational/maple-tracetree-history:tracetreehistory/history-count/


> Example Response

````json
{
  "history-count": {
    "count": 16
  }
}
````

GET http://localhost:8181/restconf/operational/maple-tracetree-history:tracetreehistory/history/{seq}/

{seq} is an interger from 0 to ( history_count -1 )

> Example Response

```json
{
  "history": [
    {
      "seq": 23,
      "pkt": {
        "pkt-str": "MaplePacket [ingressPort=openflow:3:2, frame=\narp\ndl_vlan: untagged\ndl_vlan_pcp: 0\ndl_src: 8a:95:62:10:ab:6d\ndl_dst: a6:73:53:ac:03:be\nnw_src: 10.0.0.2\nnw_dst: 10.0.0.1]",
        "pkt-hex": "a6:73:53:ac:03:be:8a:95:62:10:ab:6d:08:06:00:01:08:00:06:04:00:02:8a:95:62:10:ab:6d:0a:00:00:02:a6:73:53:ac:03:be:0a:00:00:01",
        "timestamp": "05-04-2017 08:13:28:063",
        "pkt-json-str": "{\"ingressPort\":\"openflow:3:2\",\"frame\":{\"eth_src\":\"8A:95:62:10:AB:6D\",\"eth_dst\":\"A6:73:53:AC:03:BE\",\"eth_type\":\"0x0806\",\"payload\":{\"protocolAddressLength\":\"0x04\",\"targetProtocolAddress\":\"0x0a000001\",\"hardwareType\":\"0x0001\",\"opCode\":\"0x0002\",\"protocolType\":\"0x0800\",\"targetHardwareAddress\":\"0xa67353ac03be\",\"senderHardwareAddress\":\"0x8a956210ab6d\",\"senderProtocolAddress\":\"0x0a000002\",\"hardwareAddressLength\":\"0x06\"}}}"
      },
      "tracetree-v2": {
        "tt-link-v2": [
          {
            "id": "8",
            "predicate-id": "0",
            "condition": "IPv4",
            "destination-id": "1"
          },
          {
            "id": "5",
            "predicate-id": "3",
            "condition": "!= 80",
            "destination-id": "4"
          },
          {
            "id": "6",
            "predicate-id": "2",
            "condition": "== 10.0.0.2",
            "destination-id": "3"
          },
          {
            "id": "7",
            "predicate-id": "1",
            "condition": "== 10.0.0.1",
            "destination-id": "2"
          },
          {
            "id": "10",
            "predicate-id": "0",
            "condition": "ARP",
            "destination-id": "9"
          }
        ],
        "tt-node-v2": [
          {
            "id": "4",
            "type": "L",
            "action-type": "Path",
            "link": [
              {
                "link-id": "openflow:1:4",
                "dst-node": {
                  "node-id": "openflow:0",
                  "port": "openflow:0:0"
                },
                "src-node": {
                  "node-id": "openflow:1",
                  "port": "openflow:1:4"
                }
              },
              {
                "link-id": "openflow:3:2",
                "dst-node": {
                  "node-id": "openflow:0",
                  "port": "openflow:0:0"
                },
                "src-node": {
                  "node-id": "openflow:3",
                  "port": "openflow:3:2"
                }
              },
              {
                "link-id": "openflow:4:1",
                "dst-node": {
                  "node-id": "openflow:0",
                  "port": "openflow:0:0"
                },
                "src-node": {
                  "node-id": "openflow:4",
                  "port": "openflow:4:1"
                }
              }
            ]
          },
          {
            "id": "1",
            "type": "T",
            "testfield": "IPv4_SRC"
          },
          {
            "id": "9",
            "type": "L",
            "action-type": "Flood"
          },
          {
            "id": "0",
            "type": "V",
            "matchfield": "ETH_TYPE"
          },
          {
            "id": "3",
            "type": "T",
            "testfield": "TCP_DST_PORT"
          },
          {
            "id": "2",
            "type": "T",
            "testfield": "IPv4_DST"
          }
        ]
      }
    }
  ]
}

```

GET http://localhost:8181/restconf/operational/maple-tracetree-history:tracetreehistory/

It can get all historic records, it is not recommended if you do a polling operation.
