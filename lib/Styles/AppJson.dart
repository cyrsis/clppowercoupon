class AppJson {
  static String RawJsonContainer = '''
{
  "type": "Container",
  "color": "#FF00FF",
  "height": "30.0",
  "width": "40.0" 
}

''';

  static String RawJsonAppBar = '''
{
  "type": "AppBar",
  "title": "Appbar Title",
  "centerTitle": true,
  "elevation": 0.0
}

''';

  static String RawJsonContainerEmpty = ''' 
{
  "type": "Container",
  "width": 20,
  "height":20,
}

''';
  static String containerJson = '''
{
  "type": "Container",
  "color": "#FF00FF",
  "alignment": "center",
  "child": {
    "type": "Text",
    "data": "Creatize widget",
    "maxLines": 3,
    "overflow": "ellipsis",
    "style": {
      "color": "#00FFFF",
      "fontSize": 20.0
    }
  }
}

''';

  static String textJson = '''
{
  "type": "Container",
  "color": "#FF00FF",
  "alignment": "center",
  "child": {
    "type": "Text",
    "data": "Creatize widget",
    "maxLines": 3,
    "overflow": "ellipsis",
    "style": {
      "color": "#00FFFF",
      "fontSize": 20.0
    }
  }
}

''';

  static String textSpanJson = '''
{
  "type": "Container",
  "color": "#FF00FF",
  "alignment": "center",
  "child": {
    "type": "Text",
    "maxLines": 3,
    "textSpan": {
      "text": "Flutter",
      "style": {
        "color": "#00FFFF",
        "fontSize": 26.0
      },
      "children": [
        {
          "text": " dynamic",
          "style": {
            "fontSize": 22.0
          }
        },
        {
          "text": " widget",
          "style": {
            "color": "#00FF00",
            "fontSize": 18.0
          }
        }
      ]
    }
  }
}


''';

  static String RawRaisedButtonJson = '''
{
  "type": "Container",
  "alignment": "center",
  "child": {
    "type": "RaisedButton",
    "color": "##FF00FF",
    "padding": "8,8,8,8",
    "textColor": "#00FF00",
    "elevation" : 8.0,
    "splashColor" : "#00FF00",
    "click_event" : "route://productDetail?goods_id=123",
    "child" : {
      "type": "Text",
      "data": "I am a button"
    }  
  }
}
''';

  static String RawRaisedButtonVictor = '''
{
  "type": "Container",
  "alignment": "center",
  "child": {
    "type": "RaisedButton",
    "color": "##FF00FF",
    "padding": "8,8,8,8",
    "textColor": "#00FF00",
    "elevation" : 8.0,
    "splashColor" : "#00FF00",
    "click_event" : "route://productDetail?goods_id=123",
    "child" : {
      "type": "Text",
      "data": "I am a button"
    }  
  }
}
''';

  static String RawRowJson = '''
{
  "type": "Row",
  "crossAxisAlignment": "start",
  "mainAxisAlignment": "start",
  "mainAxisSize": "max",
  "textBaseline": "alphabetic",
  "textDirection": "ltr",
  "verticalDirection": "down",
  "children":[
    {
      "type" : "Text",
      "data" : "Flutter"
    },
    {
      "type": "RaisedButton",
      "color": "##FF00FF",
      "padding": "8,8,8,8",
      "textColor": "#00FF00",
      "elevation" : 8.0,
      "splashColor" : "#00FF00",
      "child" : {
        "type": "Text",
        "data": "Widget"
      }
    },
    {
      "type" : "Text",
      "data" : "Demo"
    }
  ]
}
''';

  static String RawColumnJson = '''
{
  "type": "Column",
  "crossAxisAlignment": "start",
  "mainAxisAlignment": "start",
  "mainAxisSize": "max",
  "textBaseline": "alphabetic",
  "textDirection": "ltr",
  "verticalDirection": "down",
  "children":[
    {
      "type" : "Text",
      "data" : "Flutter"
    },
    {
      "type": "RaisedButton",
      "color": "##FF00FF",
      "padding": "8,8,8,8",
      "textColor": "#00FF00",
      "elevation" : 8.0,
      "splashColor" : "#00FF00",
      "child" : {
        "type": "Text",
        "data": "Widget"
      }
    },
    {
      "type" : "Text",
      "data" : "Demo"
    }
  ]
}
''';

  static String RawGoogleSignOutButtonJson = '''
{
  "type": "GoogleSignOutButton"
}

''';
  static String RawGoogleSignInButtonJson = '''
{
  "type": "GoogleSignInButton"
}

''';
  static String assetImageJson = '''
{
  "type": "Container",
  "color": "#FFFFFF",
  "alignment": "center",
  "child": {
    "type": "AssetImage",
    "name": "assets/vip.png"
  }
}

''';

  static String RawNetworkImageJson = '''
{
  "type": "Container",
  "color": "#FFFFFF",
  "height": 100.0,
  "width": 100.0,
  "alignment": "center",
  "child": {
    "type": "NetworkImage",
    "src": "https://images.unsplash.com/photo-1511920170033-f8396924c348?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"
  }
}

''';

  static String scaffoldJsonWithImage = '''
{
  "type": "Scaffold",
  "appBar":"Great App bar",
  "body": {
    "type": "NetworkImage",
    "src": "https://images.unsplash.com/photo-1511920170033-f8396924c348?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"
  }
  
  
}

''';

  static String scaffoldEmptyContainer = '''
{
  "type": "Scaffold",
  
  
}

''';
  static String scaffoldJson = '''
{
  "type": "Scaffold",
  "appBar":"Great App bar",
  "body": {
  "type": "GoogleSignInButton"
}
  
  
}

''';
  static String placeholderJson = '''
{
  "type": "Container",
  "color": "#FFFFFF",
  "alignment": "center",
  "child": {
    "type": "Placeholder",
    "color": "#00FF00",
    "strokeWidth": 6.0,
    "fallbackWidth": 100.0,
    "fallbackHeight": 200.0
  }
}

''';

  static String gridviewJson = '''
{
  "type": "GridView",
  "crossAxisCount": 2,
  "padding": "10, 10, 10, 10",
  "mainAxisSpacing": 4.0,
  "crossAxisSpacing": 4.0,
  "childAspectRatio": 1.6,
  "children":[
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    }
    
  ]
}

''';

  static String listviewJson = '''
{
  "type": "ListView",
  "padding": "10, 10, 10, 10",
  "children":[
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    }
    
  ]
}

''';

  static String pageviewJson = '''
{
  "type": "PageView",
  "children":[
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    }
    
  ]
}

''';

  static String expandedJson = '''
{
  "type": "Row",
  "crossAxisAlignment": "start",
  "mainAxisAlignment": "start",
  "textBaseline": "alphabetic",
  "textDirection": "ltr",
  "children":[
    {
      "type" : "Text",
      "data" : "Flutter"
    },
    {
      "type": "RaisedButton",
      "color": "##FF00FF",
      "padding": "8,8,8,8",
      "textColor": "#00FF00",
      "elevation" : 8.0,
      "splashColor" : "#00FF00",
      "child" : {
        "type": "Text",
        "data": "Widget"
      }
    },
    {
      "type" : "Text",
      "data" : "Demo"
    },
    {
      "type" : "Expanded",
      "child" : {
        "type" : "Container",
        "color" : "#FFFF00",
        "alignment" : "center",
        "child" : {
          "type" : "Text",
          "data" : "Expanded Widget"
        }
      }
    }
  ]
}
''';

  static String listviewLoadmoreJson = '''
{
  "type": "ListView",
  "padding": "10, 10, 10, 10",
  "pageSize": 10,
  "loadMoreUrl": "http://127.0.0.1:8080/list.json",
  "isDemo": true,
  "children":[
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    }
    
  ]
}

''';

  static String gridviewloadmoreJson = '''
{
  "type": "GridView",
  "crossAxisCount": 2,
  "padding": "10, 10, 10, 10",
  "mainAxisSpacing": 4.0,
  "crossAxisSpacing": 4.0,
  "childAspectRatio": 1.6,
  "pageSize": 10,
  "loadMoreUrl": "http://127.0.0.1:8080/list.json",
  "isDemo": true,
  "children":[
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    }
    
  ]
}

''';

  static String stackJson = '''
{
  "type": "Stack",
  "alignment": "topLeft",
  "children":[]
}

''';

  static String indexedstackJson = '''
{
  "type": "IndexedStack",
  "alignment": "topLeft",
  "index": 1,
  "children":[
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "Positioned",
      "top": 50.0,
      "left": 50.0,
      "child":{
        "type": "AssetImage",
        "name": "assets/vip.png"
      }
    }
  ]
}

''';

  static String sizedboxJson = '''
{
  "type": "Stack",
  "alignment": "topLeft",
  "children":[
    {
      "type": "ExpandedSizedBox",
      "child":{
        "type":"Container",
        "color": "#0000FF"
      }
    },
    {
      "type": "SizedBox",
      "width": 100.0,
      "height": 100.0,
      "child":{
        "type":"Container",
        "color": "#CC00FF"
      }
    }
  ]
}

''';

  static String opacityJson = '''
{
  "type": "Container",
  "color": "#FF00FF",
  "alignment": "center",
  "child": {
    "type":"Opacity",
    "opacity": 0.3,
    "child":{
        "type": "Text",
        "data": "Creatize Opacity widget",
        "maxLines": 3,
        "overflow": "ellipsis",
        "style": {
          "color": "#00FFFF",
          "fontSize": 20.0
        }
    }
  }
}
''';

  static String wrapJson = '''
{
  "type": "Wrap",
  "spacing" : 8.0,
  "runSpacing" : 8.0,
  "alignment":"center", 
  "runAlignment" : "start",
  "crossAxisAlignment":"center",
  "children": [
    {
        "type": "RaisedButton",
        "padding": "8,8,8,8",
        "splashColor" : "#00FF00",
        "child" : {
          "type": "Text",
          "data": "XXL"
        }  
      },
    {
        "type": "RaisedButton",
        "padding": "8,8,8,8",
        "splashColor" : "#00FF00",
        "child" : {
          "type": "Text",
          "data": "XL"
        }  
      }   
      ,
    {
        "type": "RaisedButton",
        "padding": "8,8,8,8",
        "splashColor" : "#00FF00",
        "child" : {
          "type": "Text",
          "data": "SSL"
        }  
      }   ,
    {
        "type": "RaisedButton",
        "padding": "8,8,8,8",
        "splashColor" : "#00FF00",
        "child" : {
          "type": "Text",
          "data": "L"
        }  
      },
    {
        "type": "RaisedButton",
        "padding": "8,8,8,8",
        "splashColor" : "#00FF00",
        "child" : {
          "type": "Text",
          "data": "LLL"
        }  
      },
    {
        "type": "RaisedButton",
        "padding": "8,8,8,8",
        "splashColor" : "#00FF00",
        "child" : {
          "type": "Text",
          "data": "GGG"
        }  
      },
    {
        "type": "RaisedButton",
        "padding": "8,8,8,8",
        "splashColor" : "#00FF00",
        "child" : {
          "type": "Text",
          "data": "AAA"
        }  
      }             
  ]
}
''';
}
