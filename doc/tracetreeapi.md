## TraceTree API

### YANG Model

The latest trace tree data structure is defined by the following YANG model:

``` yang
grouping tracetree-v2-grouping{
    container tracetree-v2{
        list tt-node-v2 {
            key "id";
            leaf id {
                type string;
            }
            leaf type {
                type string;
            }

            uses di:debuginfogroup;

            choice nodeattr{
                mandatory true;
                case lnodeattr{
                    when "type= 'L'";
                    leaf action-type {
                        type string;
                    }
                    list link {
                        key "link-id";
                        leaf link-id {
                            type string;
                        }
                        container src-node {
                            leaf node-id {
                                type string;
                            }
                            leaf port {
                                type string;
                            }
                        }
                        container dst-node {
                            leaf node-id {
                                type string;
                            }
                            leaf port {
                                type string;
                            }
                        }
                    }
                }
                case tnodeattr{
                    when "type='T'";
                    leaf testfield{
                        type string;
                    }
                }
                case vnodeattr{
                    when "type='V'";
                    leaf matchfield{
                        type string;
                    }
                }
           }
        }
        list tt-link-v2 {
            key "id";
            leaf id {
                type string;
            }
            leaf predicate-id {
                type string;
            }
            leaf condition {
                type string;
            }
            leaf destination-id {
                type string;
            }
        }
    }
}
```

And the history versions of trace tree is defined as the following model:

``` yang
container tracetreehistory {
    config false;
    container history-count{
        leaf count{
            type uint32;
        }
    }
    list history {
        key "seq";
        leaf seq{
            type uint32;
        }
        container pkt{
            leaf pkt-str{
                type string;
            }
            leaf pkt-json-str{
                type string;
            }
            leaf timestamp {
                type string;
            }
            list traceitemlist{
                key "seq";
                leaf seq{
                    type uint32;
                }

                uses di:debuginfogroup;

                leaf type{
                    type string;
                }
                leaf field{
                    type string;
                }
                leaf value{
                    type string;
                }
                leaf branch{
                    type string;
                }
                leaf iscompressed{
                    type boolean;
                }
            }
        }
        uses tracetree-v2-grouping;
    }
}
```

### RESTful API

#### Trace Tree (Old)

GET  http://localhost:8181/restconf/config/maple-tracetree:tracetree/

**Example Response**

```json
{
  "tracetree": {
    "ttnode": [
      {
        "id": "10",
        "maple-t-type:field": "IPv4_SRC",
        "type": "T",
        "debuginfo": {
          "filename": "MapleApp.java",
          "method": "onPacket",
          "classname": "org.opendaylight.mapleapp.impl.MapleApp",
          "linenumber": 54,
          "callMapleAPI": "IPv4SrcIs"
        }
      },
      {
        "id": "21",
        "type": "L",
        "maple-l-type:action-type": "Flood"
      },
      {
        "id": "6",
        "type": "L",
        "maple-l-type:link": [
          {
            "link-id": "openflow:1:4",
            "src-node": {
              "port": "openflow:1:4",
              "node-id": "openflow:1"
            },
            "dst-node": {
              "port": "openflow:0:0",
              "node-id": "openflow:0"
            }
          },
          {
            "link-id": "openflow:3:2",
            "src-node": {
              "port": "openflow:3:2",
              "node-id": "openflow:3"
            },
            "dst-node": {
              "port": "openflow:0:0",
              "node-id": "openflow:0"
            }
          },
          {
            "link-id": "openflow:4:1",
            "src-node": {
              "port": "openflow:4:1",
              "node-id": "openflow:4"
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
        "id": "4",
        "type": "L",
        "maple-l-type:link": [
          {
            "link-id": "openflow:4:1",
            "src-node": {
              "port": "openflow:4:1",
              "node-id": "openflow:4"
            },
            "dst-node": {
              "port": "openflow:0:0",
              "node-id": "openflow:0"
            }
          },
          {
            "link-id": "openflow:1:3",
            "src-node": {
              "port": "openflow:1:3",
              "node-id": "openflow:1"
            },
            "dst-node": {
              "port": "openflow:0:0",
              "node-id": "openflow:0"
            }
          },
          {
            "link-id": "openflow:2:2",
            "src-node": {
              "port": "openflow:2:2",
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
        "id": "15",
        "type": "L",
        "maple-l-type:link": [
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
            "link-id": "openflow:4:5",
            "src-node": {
              "port": "openflow:4:5",
              "node-id": "openflow:4"
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
          }
        ],
        "maple-l-type:action-type": "Path"
      },
      {
        "id": "2",
        "maple-t-type:field": "IPv4_DST",
        "type": "T",
        "debuginfo": {
          "filename": "MapleApp.java",
          "method": "onPacket",
          "classname": "org.opendaylight.mapleapp.impl.MapleApp",
          "linenumber": 43,
          "callMapleAPI": "IPv4DstIs"
        }
      },
      {
        "id": "13",
        "type": "L",
        "maple-l-type:link": [
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
            "link-id": "openflow:4:4",
            "src-node": {
              "port": "openflow:4:4",
              "node-id": "openflow:4"
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
        "id": "3",
        "maple-t-type:field": "TCP_DST_PORT",
        "type": "T",
        "debuginfo": {
          "filename": "MapleApp.java",
          "method": "onPacket",
          "classname": "org.opendaylight.mapleapp.impl.MapleApp",
          "linenumber": 45,
          "callMapleAPI": "TCPDstPortIs"
        }
      },
      {
        "id": "0",
        "type": "V",
        "debuginfo": {
          "filename": "MapleApp.java",
          "method": "onPacket",
          "classname": "org.opendaylight.mapleapp.impl.MapleApp",
          "linenumber": 39,
          "callMapleAPI": "ethType"
        },
        "maple-v-type:field": "ETH_TYPE"
      },
      {
        "id": "11",
        "maple-t-type:field": "IPv4_DST",
        "type": "T",
        "debuginfo": {
          "filename": "MapleApp.java",
          "method": "onPacket",
          "classname": "org.opendaylight.mapleapp.impl.MapleApp",
          "linenumber": 54,
          "callMapleAPI": "IPv4DstIs"
        }
      },
      {
        "id": "1",
        "maple-t-type:field": "IPv4_SRC",
        "type": "T",
        "debuginfo": {
          "filename": "MapleApp.java",
          "method": "onPacket",
          "classname": "org.opendaylight.mapleapp.impl.MapleApp",
          "linenumber": 43,
          "callMapleAPI": "IPv4SrcIs"
        }
      },
      {
        "id": "12",
        "maple-t-type:field": "TCP_SRC_PORT",
        "type": "T",
        "debuginfo": {
          "filename": "MapleApp.java",
          "method": "onPacket",
          "classname": "org.opendaylight.mapleapp.impl.MapleApp",
          "linenumber": 56,
          "callMapleAPI": "TCPSrcPortIs"
        }
      }
    ],
    "ttlink": [
      {
        "id": "20",
        "destination-id": "1",
        "condition": "IPv4",
        "predicate-id": "0"
      },
      {
        "id": "8",
        "destination-id": "3",
        "condition": "== 10.0.0.2",
        "predicate-id": "2"
      },
      {
        "id": "19",
        "destination-id": "10",
        "condition": "!= 10.0.0.1",
        "predicate-id": "1"
      },
      {
        "id": "9",
        "destination-id": "2",
        "condition": "== 10.0.0.1",
        "predicate-id": "1"
      },
      {
        "id": "5",
        "destination-id": "4",
        "condition": "== 80",
        "predicate-id": "3"
      },
      {
        "id": "16",
        "destination-id": "15",
        "condition": "!= 80",
        "predicate-id": "12"
      },
      {
        "id": "17",
        "destination-id": "12",
        "condition": "== 10.0.0.1",
        "predicate-id": "11"
      },
      {
        "id": "7",
        "destination-id": "6",
        "condition": "!= 80",
        "predicate-id": "3"
      },
      {
        "id": "18",
        "destination-id": "11",
        "condition": "== 10.0.0.2",
        "predicate-id": "10"
      },
      {
        "id": "22",
        "destination-id": "21",
        "condition": "ARP",
        "predicate-id": "0"
      },
      {
        "id": "14",
        "destination-id": "13",
        "condition": "== 80",
        "predicate-id": "12"
      }
    ]
  }
}

````

#### Trace Tree Version Count

GET http://localhost:8181/restconf/operational/maple-tracetree-history:tracetreehistory/history-count/


**Example Response**

````json
{
  "history-count": {
    "count": 52
  }
}

````

#### Trace Tree History

GET http://localhost:8181/restconf/operational/maple-tracetree-history:tracetreehistory/history/{seq}/

> `{seq}` is an integer between 0 and ( history_count -1 ).

**Example Response**

```json
{
  "history": [
    {
      "seq": 50,
      "pkt": {
        "pkt-str": "MaplePacket [ingressPort=openflow:4:5, frame=\nip\ndl_vlan: untagged\ndl_vlan_pcp: 0\ndl_src: ae:ac:d2:9b:df:d2\ndl_dst: d6:32:66:a8:86:0f\nnw_src: 10.0.0.1\nnw_dst: 10.0.0.2\nnw_tos: 0\nnw_proto: 6\ntcpsrc: 37364\ntcpdst: 80]",
        "timestamp": "29-04-2017 13:52:40:852",
        "pkt-json-str": "{\"ingressPort\":\"openflow:4:5\",\"frame\":{\"payload\":{\"fragmentOffset\":\"0x0000\",\"IPv4_DST\":\"10.0.0.2\",\"IPv4_SRC\":\"10.0.0.1\",\"length\":\"0x05\",\"flags\":\"0x02\",\"version\":\"0x04\",\"diffServ\":\"0x00\",\"ttl\":\"0x40\",\"protocol\":\"0x06\",\"identification\":\"0xa13f\",\"payload\":{\"sequence\":\"0x00f5b4af\",\"dataOffset\":\"0x0a\",\"windowSize\":\"0x7210\",\"srcip\":\"0x0000\",\"TCP_DST_PORT\":\"0x0050\",\"acknowledge\":\"0x00000000\",\"payload\":{\"data\":\"\"},\"flags\":\"0x0002\",\"checksum\":\"0x5f21\",\"options\":\"0x020405b40402080a055115900000000001030309\",\"TCP_SRC_PORT\":\"0x91f4\"},\"totallength\":\"0x003c\",\"checksum\":\"0x857a\"},\"ETH_SRC\":\"AE:AC:D2:9B:DF:D2\",\"ETH_DST\":\"D6:32:66:A8:86:0F\",\"ETH_TYPE\":\"0x0800\"}}",
        "traceitemlist": [
          {
            "seq": 0,
            "value": "2048",
            "field": "ETH_TYPE",
            "iscompressed": false,
            "debuginfo": {
              "filename": "MapleApp.java",
              "method": "onPacket",
              "classname": "org.opendaylight.mapleapp.impl.MapleApp",
              "callMapleAPI": "ethType",
              "linenumber": 39
            },
            "type": "V"
          },
          {
            "seq": 1,
            "value": "167772161",
            "branch": "1",
            "type": "T",
            "field": "IPv4_SRC",
            "iscompressed": false,
            "debuginfo": {
              "filename": "MapleApp.java",
              "method": "onPacket",
              "classname": "org.opendaylight.mapleapp.impl.MapleApp",
              "callMapleAPI": "IPv4SrcIs",
              "linenumber": 43
            }
          },
          {
            "seq": 2,
            "value": "167772162",
            "branch": "1",
            "type": "T",
            "field": "IPv4_DST",
            "iscompressed": false,
            "debuginfo": {
              "filename": "MapleApp.java",
              "method": "onPacket",
              "classname": "org.opendaylight.mapleapp.impl.MapleApp",
              "callMapleAPI": "IPv4DstIs",
              "linenumber": 43
            }
          },
          {
            "seq": 3,
            "value": "80",
            "branch": "1",
            "type": "T",
            "field": "TCP_DST_PORT",
            "iscompressed": false,
            "debuginfo": {
              "filename": "MapleApp.java",
              "method": "onPacket",
              "classname": "org.opendaylight.mapleapp.impl.MapleApp",
              "callMapleAPI": "TCPDstPortIs",
              "linenumber": 45
            }
          }
        ]
      },
      "tracetree-v2": {
        "tt-link-v2": [
          {
            "id": "8",
            "predicate-id": "2",
            "condition": "== 10.0.0.2",
            "destination-id": "3"
          },
          {
            "id": "9",
            "predicate-id": "1",
            "condition": "== 10.0.0.1",
            "destination-id": "2"
          },
          {
            "id": "20",
            "predicate-id": "0",
            "condition": "ARP",
            "destination-id": "19"
          },
          {
            "id": "14",
            "predicate-id": "12",
            "condition": "!= 80",
            "destination-id": "13"
          },
          {
            "id": "15",
            "predicate-id": "11",
            "condition": "== 10.0.0.1",
            "destination-id": "12"
          },
          {
            "id": "5",
            "predicate-id": "3",
            "condition": "== 80",
            "destination-id": "4"
          },
          {
            "id": "16",
            "predicate-id": "10",
            "condition": "== 10.0.0.2",
            "destination-id": "11"
          },
          {
            "id": "17",
            "predicate-id": "1",
            "condition": "!= 10.0.0.1",
            "destination-id": "10"
          },
          {
            "id": "7",
            "predicate-id": "3",
            "condition": "!= 80",
            "destination-id": "6"
          },
          {
            "id": "18",
            "predicate-id": "0",
            "condition": "IPv4",
            "destination-id": "1"
          }
        ],
        "tt-node-v2": [
          {
            "id": "4",
            "type": "L",
            "action-type": "Path",
            "link": [
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
              },
              {
                "link-id": "openflow:1:3",
                "dst-node": {
                  "node-id": "openflow:0",
                  "port": "openflow:0:0"
                },
                "src-node": {
                  "node-id": "openflow:1",
                  "port": "openflow:1:3"
                }
              },
              {
                "link-id": "openflow:2:2",
                "dst-node": {
                  "node-id": "openflow:0",
                  "port": "openflow:0:0"
                },
                "src-node": {
                  "node-id": "openflow:2",
                  "port": "openflow:2:2"
                }
              }
            ]
          },
          {
            "id": "6",
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
            "debuginfo": {
              "filename": "MapleApp.java",
              "method": "onPacket",
              "classname": "org.opendaylight.mapleapp.impl.MapleApp",
              "callMapleAPI": "IPv4SrcIs",
              "linenumber": 43
            },
            "testfield": "IPv4_SRC"
          },
          {
            "id": "12",
            "type": "T",
            "debuginfo": {
              "filename": "MapleApp.java",
              "method": "onPacket",
              "classname": "org.opendaylight.mapleapp.impl.MapleApp",
              "callMapleAPI": "TCPSrcPortIs",
              "linenumber": 56
            },
            "testfield": "TCP_SRC_PORT"
          },
          {
            "id": "0",
            "type": "V",
            "debuginfo": {
              "filename": "MapleApp.java",
              "method": "onPacket",
              "classname": "org.opendaylight.mapleapp.impl.MapleApp",
              "callMapleAPI": "ethType",
              "linenumber": 39
            },
            "matchfield": "ETH_TYPE"
          },
          {
            "id": "11",
            "type": "T",
            "debuginfo": {
              "filename": "MapleApp.java",
              "method": "onPacket",
              "classname": "org.opendaylight.mapleapp.impl.MapleApp",
              "callMapleAPI": "IPv4DstIs",
              "linenumber": 54
            },
            "testfield": "IPv4_DST"
          },
          {
            "id": "3",
            "type": "T",
            "debuginfo": {
              "filename": "MapleApp.java",
              "method": "onPacket",
              "classname": "org.opendaylight.mapleapp.impl.MapleApp",
              "callMapleAPI": "TCPDstPortIs",
              "linenumber": 45
            },
            "testfield": "TCP_DST_PORT"
          },
          {
            "id": "2",
            "type": "T",
            "debuginfo": {
              "filename": "MapleApp.java",
              "method": "onPacket",
              "classname": "org.opendaylight.mapleapp.impl.MapleApp",
              "callMapleAPI": "IPv4DstIs",
              "linenumber": 43
            },
            "testfield": "IPv4_DST"
          },
          {
            "id": "13",
            "type": "L",
            "action-type": "Path",
            "link": [
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
                "link-id": "openflow:4:5",
                "dst-node": {
                  "node-id": "openflow:0",
                  "port": "openflow:0:0"
                },
                "src-node": {
                  "node-id": "openflow:4",
                  "port": "openflow:4:5"
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
              }
            ]
          },
          {
            "id": "10",
            "type": "T",
            "debuginfo": {
              "filename": "MapleApp.java",
              "method": "onPacket",
              "classname": "org.opendaylight.mapleapp.impl.MapleApp",
              "callMapleAPI": "IPv4SrcIs",
              "linenumber": 54
            },
            "testfield": "IPv4_SRC"
          },
          {
            "id": "19",
            "type": "L",
            "action-type": "Flood"
          }
        ]
      }
    }
  ]
}

```


#### All History of Trace Tree

GET http://localhost:8181/restconf/operational/maple-tracetree-history:tracetreehistory/

> It can get all historic records, it is not recommended if you do a polling operation.