package mochi.as3
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.net.LocalConnection;
   import flash.net.URLRequest;
   import flash.net.URLVariables;
   import flash.system.Capabilities;
   import flash.system.Security;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import flash.utils.Timer;
   
   public class MochiServices
   {
      
      public static const CONNECTED:String = "onConnected";
      
      private static var _id:String;
      
      private static var _container:Object;
      
      private static var _clip:MovieClip;
      
      private static var _loader:Loader;
      
      private static var _timer:Timer;
      
      private static var _preserved:Object;
      
      private static var _servURL:String = "http://www.mochiads.com/static/lib/services/";
      
      private static var _services:String = "services.swf";
      
      private static var _mochiLC:String = "MochiLC.swf";
      
      private static var _swfVersion:String;
      
      private static var _listenChannelName:String = "__ms_";
      
      private static var _sendChannel:LocalConnection;
      
      private static var _sendChannelName:String;
      
      private static var _connecting:Boolean = false;
      
      private static var _connected:Boolean = false;
      
      public static var netup:Boolean = true;
      
      public static var §_-Qt§:Boolean = false;
      
      public static var onError:Object;
      
      public static var widget:Boolean = false;
      
      private static var _mochiLocalConnection:MovieClip;
      
      private static var _queue:Array;
      
      private static var _nextCallbackID:Number;
      
      private static var _callbacks:Object;
      
      private static var _dispatcher:MochiEventDispatcher = new MochiEventDispatcher();
       
      
      public function MochiServices()
      {
         super();
      }
      
      public static function get id() : String
      {
         return _id;
      }
      
      public static function get clip() : Object
      {
         return _container;
      }
      
      public static function get childClip() : Object
      {
         return _clip;
      }
      
      public static function getVersion() : String
      {
         return "3.9.4 as3";
      }
      
      public static function allowDomains(param1:String) : String
      {
         var _loc2_:String = null;
         if(Security.sandboxType != "application")
         {
            Security.allowDomain("*");
            Security.allowInsecureDomain("*");
         }
         if(param1.indexOf("http://") != -1)
         {
            _loc2_ = param1.split("/")[2].split(":")[0];
            if(Security.sandboxType != "application")
            {
               Security.allowDomain(_loc2_);
               Security.allowInsecureDomain(_loc2_);
            }
         }
         return _loc2_;
      }
      
      public static function §_-I7§() : Boolean
      {
         return Security.sandboxType != "localWithFile";
      }
      
      public static function set comChannelName(param1:String) : void
      {
         if(param1 != null)
         {
            if(param1.length > 3)
            {
               _sendChannelName = param1 + "_fromgame";
               initComChannels();
            }
         }
      }
      
      public static function get connected() : Boolean
      {
         return _connected;
      }
      
      public static function §_-0C§(param1:String, param2:Boolean) : void
      {
         param1 = param1.toLowerCase();
         if(param1.length != 16)
         {
            return;
         }
         if(param1 == "1e113c7239048b3f")
         {
            if(!param2)
            {
            }
            return;
         }
         if(param1 == "84993a1de4031cd8")
         {
            if(!param2)
            {
            }
            return;
         }
         var _loc3_:Number = 0;
         loop0:
         while(true)
         {
            if(_loc3_ >= param1.length)
            {
               return;
            }
            switch(param1.charAt(_loc3_))
            {
               case "0":
               case "1":
               case "2":
               case "3":
               case "4":
               case "5":
               case "6":
               case "7":
               case "8":
               case "9":
               case "a":
               case "b":
               case "c":
               case "d":
               case "e":
               case "f":
                  _loc3_++;
                  continue;
               default:
                  break loop0;
            }
         }
      }
      
      public static function connect(param1:String, param2:Object, param3:Object = null) : void
      {
         var id:String = param1;
         var clip:Object = param2;
         var onError:Object = param3;
         §_-0C§(id,false);
         if(onError != null)
         {
            MochiServices.onError = onError;
         }
         else if(MochiServices.onError == null)
         {
            MochiServices.onError = function(param1:String):void
            {
            };
         }
         if(clip is DisplayObject)
         {
            if(clip.stage == null)
            {
            }
            if(!_connected && _clip == null)
            {
               _connecting = true;
               init(id,clip);
            }
         }
      }
      
      public static function disconnect() : void
      {
         if(_connected || _connecting)
         {
            if(_clip != null)
            {
               if(_clip.parent != null)
               {
                  if(_clip.parent is Sprite)
                  {
                     Sprite(_clip.parent).removeChild(_clip);
                     _clip = null;
                  }
               }
            }
            _connected = false;
            _connecting = false;
            flush(true);
            try
            {
               _mochiLocalConnection.close();
            }
            catch(error:Error)
            {
            }
         }
         if(_timer != null)
         {
            try
            {
               _timer.stop();
               _timer.removeEventListener(TimerEvent.TIMER,connectWait);
               _timer = null;
               return;
            }
            catch(error:Error)
            {
               return;
            }
         }
      }
      
      public static function §_-JR§() : void
      {
         _container.addEventListener(Event.ENTER_FRAME,MochiServices.bringToTop,false,0,true);
         if(_clip != null)
         {
            _clip.visible = true;
         }
      }
      
      public static function doClose() : void
      {
         _container.removeEventListener(Event.ENTER_FRAME,MochiServices.bringToTop);
      }
      
      public static function bringToTop(param1:Event = null) : void
      {
         var e:Event = param1;
         if(MochiServices.clip != null && MochiServices.childClip != null)
         {
            try
            {
               if(MochiServices.clip.numChildren > 1)
               {
                  MochiServices.clip.setChildIndex(MochiServices.childClip,MochiServices.clip.numChildren - 1);
               }
               return;
            }
            catch(errorObject:Error)
            {
               _container.removeEventListener(Event.ENTER_FRAME,MochiServices.bringToTop);
               return;
            }
         }
      }
      
      private static function init(param1:String, param2:Object) : void
      {
         _id = param1;
         if(param2 != null)
         {
            _container = param2;
            loadCommunicator(param1,_container);
         }
      }
      
      public static function §_-MV§(param1:Object = null, param2:Boolean = true) : void
      {
         if(_clip.parent)
         {
            _clip.parent.removeChild(_clip);
         }
         if(param1 != null)
         {
            if(param1 is DisplayObjectContainer)
            {
               _container = param1;
            }
         }
         if(param2)
         {
            if(_container is DisplayObjectContainer)
            {
               DisplayObjectContainer(_container).addChild(_clip);
            }
         }
      }
      
      private static function loadCommunicator(param1:String, param2:Object) : MovieClip
      {
         if(_clip != null)
         {
            return _clip;
         }
         if(!MochiServices.§_-I7§())
         {
            MochiServices.onError("NotConnected");
            return null;
         }
         if(§_-AY§(param2).servURL)
         {
            _servURL = §_-AY§(param2).servURL;
         }
         var _loc3_:String = _servURL + _services;
         if(§_-AY§(param2).servicesURL)
         {
            _loc3_ = §_-AY§(param2).servicesURL;
         }
         _listenChannelName = _listenChannelName + (Math.floor(new Date().time) + "_" + Math.floor(Math.random() * 99999));
         MochiServices.allowDomains(_loc3_);
         _clip = new MovieClip();
         loadLCBridge(_clip);
         _loader = new Loader();
         _loader.contentLoaderInfo.addEventListener(Event.COMPLETE,detach);
         _loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,detach);
         _loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,loadError);
         var _loc4_:URLRequest = new URLRequest(_loc3_);
         var _loc5_:URLVariables = new URLVariables();
         _loc5_.listenLC = _listenChannelName;
         _loc5_.mochiad_options = param2.loaderInfo.parameters.mochiad_options;
         _loc5_.api_version = getVersion();
         if(widget)
         {
            _loc5_.widget = true;
         }
         _loc4_.data = _loc5_;
         _loader.load(_loc4_);
         _clip.addChild(_loader);
         _sendChannel = new LocalConnection();
         _queue = [];
         _nextCallbackID = 0;
         _callbacks = {};
         _timer = new Timer(10000,1);
         _timer.addEventListener(TimerEvent.TIMER,connectWait);
         _timer.start();
         return _clip;
      }
      
      private static function detach(param1:Event) : void
      {
         var _loc2_:LoaderInfo = LoaderInfo(param1.target);
         _loc2_.removeEventListener(Event.COMPLETE,detach);
         _loc2_.removeEventListener(IOErrorEvent.IO_ERROR,detach);
         _loc2_.removeEventListener(Event.COMPLETE,loadLCBridgeComplete);
         _loc2_.removeEventListener(IOErrorEvent.IO_ERROR,loadError);
      }
      
      private static function loadLCBridge(param1:Object) : void
      {
         var _loc2_:Loader = new Loader();
         var _loc3_:String = _servURL + _mochiLC;
         var _loc4_:URLRequest = new URLRequest(_loc3_);
         _loc2_.contentLoaderInfo.addEventListener(Event.COMPLETE,detach);
         _loc2_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,detach);
         _loc2_.contentLoaderInfo.addEventListener(Event.COMPLETE,loadLCBridgeComplete);
         _loc2_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,loadError);
         _loc2_.load(_loc4_);
         param1.addChild(_loc2_);
      }
      
      private static function loadLCBridgeComplete(param1:Event) : void
      {
         var _loc2_:Loader = LoaderInfo(param1.target).loader;
         _mochiLocalConnection = MovieClip(_loc2_.content);
         §_-7b§();
      }
      
      private static function loadError(param1:Object) : void
      {
         _clip._mochiad_ctr_failed = true;
         MochiServices.disconnect();
         MochiServices.onError("IOError");
      }
      
      public static function connectWait(param1:TimerEvent) : void
      {
         if(!_connected)
         {
            _clip._mochiad_ctr_failed = true;
            MochiServices.disconnect();
            MochiServices.onError("IOError");
         }
         else
         {
            _timer.stop();
            _timer.removeEventListener(TimerEvent.TIMER,connectWait);
            _timer = null;
         }
      }
      
      private static function §_-7b§() : void
      {
         _mochiLocalConnection.connect(_listenChannelName);
         _clip.handshake = function(param1:Object):void
         {
            MochiServices.comChannelName = param1.newChannel;
         };
      }
      
      private static function initComChannels() : void
      {
         if(!_connected)
         {
            _connecting = false;
            _connected = true;
            _mochiLocalConnection.send(_sendChannelName,"onReceive",{"methodName":"handshakeDone"});
            _mochiLocalConnection.send(_sendChannelName,"onReceive",{
               "methodName":"registerGame",
               "preserved":_preserved,
               "id":_id,
               "version":getVersion(),
               "parentURL":_container.loaderInfo.loaderURL
            });
            _clip.onReceive = onReceive;
            _clip.onEvent = onEvent;
            _clip.onError = function():void
            {
               MochiServices.onError("IOError");
            };
            while(_queue.length > 0)
            {
               _mochiLocalConnection.send(_sendChannelName,"onReceive",_queue.shift());
            }
         }
      }
      
      private static function onReceive(param1:Object) : void
      {
         var pkg:Object = param1;
         var cb:String = pkg.callbackID;
         var cblst:Object = _callbacks[cb];
         if(!cblst)
         {
            return;
         }
         var method:* = cblst.callbackMethod;
         var methodName:String = "";
         var obj:Object = cblst.callbackObject;
         if(obj && typeof method == "string")
         {
            methodName = method;
            if(obj[method] != null)
            {
               method = obj[method];
            }
         }
         if(method != undefined)
         {
            try
            {
               method.apply(obj,pkg.args);
            }
            catch(error:Error)
            {
            }
         }
         else if(obj != null)
         {
            try
            {
               obj(pkg.args);
            }
            catch(error:Error)
            {
            }
         }
         delete _callbacks[cb];
      }
      
      private static function onEvent(param1:Object) : void
      {
         var _loc2_:String = param1.target;
         var _loc3_:String = param1.event;
         switch(_loc2_)
         {
            case "services":
               MochiServices.triggerEvent(param1.event,param1.args);
               break;
            case "events":
               MochiEvents.triggerEvent(param1.event,param1.args);
               break;
            case "coins":
               MochiCoins.triggerEvent(param1.event,param1.args);
               break;
            case "social":
               MochiSocial.triggerEvent(param1.event,param1.args);
         }
      }
      
      private static function flush(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Object = null;
         if(_clip && _queue)
         {
            while(_queue.length > 0)
            {
               _loc2_ = _queue.shift();
               _loc3_ = null;
               if(_loc2_ != null)
               {
                  if(_loc2_.callbackID != null)
                  {
                     _loc3_ = _callbacks[_loc2_.callbackID];
                  }
                  delete _callbacks[_loc2_.callbackID];
                  if(param1 && _loc3_ != null)
                  {
                     handleError(_loc2_.args,_loc3_.callbackObject,_loc3_.callbackMethod);
                  }
               }
            }
         }
      }
      
      private static function handleError(param1:Object, param2:Object, param3:Object) : void
      {
         var args:Object = param1;
         var callbackObject:Object = param2;
         var callbackMethod:Object = param3;
         if(args != null)
         {
            if(args.onError != null)
            {
               args.onError("NotConnected");
            }
            if(args.options != null && args.options.onError != null)
            {
               args.options.onError("NotConnected");
            }
         }
         if(callbackMethod != null)
         {
            args = {};
            args.error = true;
            args.errorCode = "NotConnected";
            if(callbackObject != null && callbackMethod is String)
            {
               try
               {
                  callbackObject[callbackMethod](args);
                  return;
               }
               catch(error:Error)
               {
                  return;
               }
            }
            else if(callbackMethod != null)
            {
               try
               {
                  callbackMethod.apply(args);
                  return;
               }
               catch(error:Error)
               {
                  return;
               }
            }
         }
      }
      
      public static function send(param1:String, param2:Object = null, param3:Object = null, param4:Object = null) : void
      {
         if(_connected)
         {
            _mochiLocalConnection.send(_sendChannelName,"onReceive",{
               "methodName":param1,
               "args":param2,
               "callbackID":_nextCallbackID
            });
         }
         else
         {
            if(_clip == null || !_connecting)
            {
               handleError(param2,param3,param4);
               flush(true);
               return;
            }
            _queue.push({
               "methodName":param1,
               "args":param2,
               "callbackID":_nextCallbackID
            });
         }
         if(_clip != null)
         {
            if(_callbacks != null)
            {
               _callbacks[_nextCallbackID] = {
                  "callbackObject":param3,
                  "callbackMethod":param4
               };
               _nextCallbackID++;
            }
         }
      }
      
      private static function §_-AY§(param1:Object) : Object
      {
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc5_:Number = NaN;
         var _loc6_:Array = null;
         var _loc2_:Object = {};
         if(param1.stage)
         {
            _loc3_ = param1.stage.loaderInfo.parameters.mochiad_options;
         }
         else
         {
            _loc3_ = param1.loaderInfo.parameters.mochiad_options;
         }
         if(_loc3_)
         {
            _loc4_ = _loc3_.split("&");
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               _loc6_ = _loc4_[_loc5_].split("=");
               _loc2_[unescape(_loc6_[0])] = unescape(_loc6_[1]);
               _loc5_++;
            }
         }
         return _loc2_;
      }
      
      public static function addLinkEvent(param1:String, param2:String, param3:DisplayObjectContainer, param4:Function = null) : void
      {
         var avm1Click:DisplayObject = null;
         var x:String = null;
         var req:URLRequest = null;
         var loader:Loader = null;
         var setURL:Function = null;
         var err:Function = null;
         var complete:Function = null;
         var url:String = param1;
         var burl:String = param2;
         var btn:DisplayObjectContainer = param3;
         var onClick:Function = param4;
         var vars:Object = new Object();
         vars["mav"] = getVersion();
         vars["swfv"] = "9";
         vars["swfurl"] = btn.loaderInfo.loaderURL;
         vars["fv"] = Capabilities.version;
         vars["os"] = Capabilities.os;
         vars["lang"] = Capabilities.language;
         vars["scres"] = Capabilities.screenResolutionX + "x" + Capabilities.screenResolutionY;
         var s:String = "?";
         var i:Number = 0;
         for(x in vars)
         {
            if(i != 0)
            {
               s = s + "&";
            }
            i++;
            s = s + x + "=" + escape(vars[x]);
         }
         req = new URLRequest("http://link.mochiads.com/linkping.swf");
         loader = new Loader();
         setURL = function(param1:String):void
         {
            if(avm1Click)
            {
               btn.removeChild(avm1Click);
            }
            avm1Click = clickMovie(param1,onClick);
            var _loc2_:Rectangle = btn.getBounds(btn);
            btn.addChild(avm1Click);
            avm1Click.x = _loc2_.x;
            avm1Click.y = _loc2_.y;
            avm1Click.scaleX = 0.01 * _loc2_.width;
            avm1Click.scaleY = 0.01 * _loc2_.height;
         };
         err = function(param1:Object):void
         {
            netup = false;
            param1.target.removeEventListener(param1.type,arguments.callee);
            setURL(burl);
         };
         complete = function(param1:Object):void
         {
            param1.target.removeEventListener(param1.type,arguments.callee);
         };
         if(netup)
         {
            setURL(url + s);
         }
         else
         {
            setURL(burl);
         }
         if(!(§_-Qt§ || _connected))
         {
            §_-Qt§ = true;
            loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,err);
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE,complete);
            loader.load(req);
         }
      }
      
      private static function clickMovie(param1:String, param2:Function) : MovieClip
      {
         var _loc4_:int = 0;
         var _loc14_:Loader = null;
         var _loc3_:Array = [150,21,0,7,1,0,0,0,0,98,116,110,0,7,2,0,0,0,0,116,104,105,115,0,28,150,22,0,0,99,114,101,97,116,101,69,109,112,116,121,77,111,118,105,101,67,108,105,112,0,82,135,1,0,0,23,150,13,0,4,0,0,111,110,82,101,108,101,97,115,101,0,142,8,0,0,0,0,2,42,0,114,0,150,17,0,0,32,0,7,1,0,0,0,8,0,0,115,112,108,105,116,0,82,135,1,0,1,23,150,7,0,4,1,7,0,0,0,0,78,150,8,0,0,95,98,108,97,110,107,0,154,1,0,0,150,7,0,0,99,108,105,99,107,0,150,7,0,4,1,7,1,0,0,0,78,150,27,0,7,2,0,0,0,7,0,0,0,0,0,76,111,99,97,108,67,111,110,110,101,99,116,105,111,110,0,64,150,6,0,0,115,101,110,100,0,82,79,150,15,0,4,0,0,95,97,108,112,104,97,0,7,0,0,0,0,79,150,23,0,7,255,0,255,0,7,1,0,0,0,4,0,0,98,101,103,105,110,70,105,108,108,0,82,23,150,25,0,7,0,0,0,0,7,0,0,0,0,7,2,0,0,0,4,0,0,109,111,118,101,84,111,0,82,23,150,25,0,7,100,0,0,0,7,0,0,0,0,7,2,0,0,0,4,0,0,108,105,110,101,84,111,0,82,23,150,25,0,7,100,0,0,0,7,100,0,0,0,7,2,0,0,0,4,0,0,108,105,110,101,84,111,0,82,23,150,25,0,7,0,0,0,0,7,100,0,0,0,7,2,0,0,0,4,0,0,108,105,110,101,84,111,0,82,23,150,25,0,7,0,0,0,0,7,0,0,0,0,7,2,0,0,0,4,0,0,108,105,110,101,84,111,0,82,23,150,16,0,7,0,0,0,0,4,0,0,101,110,100,70,105,108,108,0,82,23];
         var _loc5_:Array = [104,0,31,64,0,7,208,0,0,12,1,0,67,2,255,255,255,63,3];
         var _loc6_:Array = [0,64,0,0,0];
         var _loc7_:MovieClip = new MovieClip();
         var _loc8_:LocalConnection = new LocalConnection();
         var _loc9_:String = "_click_" + Math.floor(Math.random() * 999999) + "_" + Math.floor(new Date().time);
         _loc8_ = new LocalConnection();
         _loc7_.lc = _loc8_;
         _loc7_.click = param2;
         _loc8_.client = _loc7_;
         _loc8_.connect(_loc9_);
         var _loc10_:ByteArray = new ByteArray();
         var _loc11_:ByteArray = new ByteArray();
         _loc11_.endian = Endian.LITTLE_ENDIAN;
         _loc11_.writeShort(1);
         _loc11_.writeUTFBytes(param1 + " " + _loc9_);
         _loc11_.writeByte(0);
         var _loc12_:uint = _loc3_.length + _loc11_.length + 4;
         var _loc13_:uint = _loc12_ + 35;
         _loc10_.endian = Endian.LITTLE_ENDIAN;
         _loc10_.writeUTFBytes("FWS");
         _loc10_.writeByte(8);
         _loc10_.writeUnsignedInt(_loc13_);
         for each(_loc4_ in _loc5_)
         {
            _loc10_.writeByte(_loc4_);
         }
         _loc10_.writeUnsignedInt(_loc12_);
         _loc10_.writeByte(136);
         _loc10_.writeShort(_loc11_.length);
         _loc10_.writeBytes(_loc11_);
         for each(_loc4_ in _loc3_)
         {
            _loc10_.writeByte(_loc4_);
         }
         for each(_loc4_ in _loc6_)
         {
            _loc10_.writeByte(_loc4_);
         }
         _loc14_ = new Loader();
         _loc14_.loadBytes(_loc10_);
         _loc7_.addChild(_loc14_);
         return _loc7_;
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         _dispatcher.addEventListener(param1,param2);
      }
      
      public static function triggerEvent(param1:String, param2:Object) : void
      {
         _dispatcher.triggerEvent(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         _dispatcher.removeEventListener(param1,param2);
      }
   }
}
