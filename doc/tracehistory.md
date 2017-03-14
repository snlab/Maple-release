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

GET http://localhost:8181/restconf/operational/maple-tracetree-history:tracetreehistory/history/\<seq\>/

\<seq\> is an interger from 0 to ( history_count -1 )

> Example Response

```json
{
  "history": [
    {
      "seq": 15,
      "pkt": {
        "pkt-hex": "00:00:00:00:00:03:00:00:00:00:00:01:08:06:00:01:08:00:06:04:00:02:00:00:00:00:00:01:0a:00:00:01:00:00:00:00:00:03:0a:00:00:03",
        "timestamp": "03-03-2017 21:28:27:560",
        "pkt-str": "MaplePacket [ingressPort=openflow:3:3, frame=\narp\ndl_vlan: untagged\ndl_vlan_pcp: 0\ndl_src: 00:00:00:00:00:01\ndl_dst: 00:00:00:00:00:03\nnw_src: 10.0.0.1\nnw_dst: 10.0.0.3]"
      },
      "tracetree-v2": {
        "tt-link-v2": [
          {
            "id": "8",
            "predicate-id": "6",
            "condition": "10.0.0.1",
            "destination-id": "7"
          },
          {
            "id": "9",
            "predicate-id": "1",
            "condition": "10.0.0.3",
            "destination-id": "6"
          },
          {
            "id": "12",
            "predicate-id": "0",
            "condition": "ARP",
            "destination-id": "11"
          },
          {
            "id": "4",
            "predicate-id": "2",
            "condition": "10.0.0.3",
            "destination-id": "3"
          },
          {
            "id": "5",
            "predicate-id": "1",
            "condition": "10.0.0.1",
            "destination-id": "2"
          },
          {
            "id": "10",
            "predicate-id": "0",
            "condition": "IPv4",
            "destination-id": "1"
          }
        ],
        "tt-node-v2": [
          {
            "id": "7",
            "type": "L",
            "action-type": "Path",
            "link": [
              {
                "link-id": "openflow:3:3",
                "dst-node": {
                  "node-id": "openflow:0",
                  "port": "openflow:0:0"
                },
                "src-node": {
                  "node-id": "openflow:3",
                  "port": "openflow:3:3"
                }
              },
              {
                "link-id": "openflow:1:1",
                "dst-node": {
                  "node-id": "openflow:0",
                  "port": "openflow:0:0"
                },
                "src-node": {
                  "node-id": "openflow:1",
                  "port": "openflow:1:1"
                }
              },
              {
                "link-id": "openflow:2:1",
                "dst-node": {
                  "node-id": "openflow:0",
                  "port": "openflow:0:0"
                },
                "src-node": {
                  "node-id": "openflow:2",
                  "port": "openflow:2:1"
                }
              }
            ]
          },
          {
            "id": "6",
            "type": "V",
            "matchfield": "IPv4_DST"
          },
          {
            "id": "1",
            "type": "V",
            "matchfield": "IPv4_SRC"
          },
          {
            "id": "0",
            "type": "V",
            "matchfield": "ETH_TYPE"
          },
          {
            "id": "11",
            "type": "L",
            "action-type": "Flood"
          },
          {
            "id": "3",
            "type": "L",
            "action-type": "Path",
            "link": [
              {
                "link-id": "openflow:2:3",
                "dst-node": {
                  "node-id": "openflow:0",
                  "port": "openflow:0:0"
                },
                "src-node": {
                  "node-id": "openflow:2",
                  "port": "openflow:2:3"
                }
              },
              {
                "link-id": "openflow:3:1",
                "dst-node": {
                  "node-id": "openflow:0",
                  "port": "openflow:0:0"
                },
                "src-node": {
                  "node-id": "openflow:3",
                  "port": "openflow:3:1"
                }
              },
              {
                "link-id": "openflow:1:2",
                "dst-node": {
                  "node-id": "openflow:0",
                  "port": "openflow:0:0"
                },
                "src-node": {
                  "node-id": "openflow:1",
                  "port": "openflow:1:2"
                }
              }
            ]
          },
          {
            "id": "2",
            "type": "V",
            "matchfield": "IPv4_DST"
          }
        ]
      }
    }
  ]
}

```

GET http://localhost:8181/restconf/operational/maple-tracetree-history:tracetreehistory/

It can get all historic records, it is not recommended if you do a polling operation.
