package fl.lang
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.system.Capabilities;
   import flash.utils.Dictionary;
   import flash.xml.XMLDocument;
   import flash.xml.XMLNode;
   
   public class Locale extends EventDispatcher
   {
      
      private static var flaName:String;
      
      private static var defaultLang:String;
      
      private static var xmlLang:String = Capabilities.language;
      
      private static var xmlMap:Object = new Object();
      
      private static var xmlDoc:XMLDocument;
      
      private static var stringMap:Object = new Object();
      
      private static var delayedInstanceDict:Dictionary = new Dictionary(true);
      
      private static var delayedInstanceParentDict:Dictionary = new Dictionary(true);
      
      private static var currentXMLMapIndex:Number = -1;
      
      private static var callback:Function;
      
      private static var autoReplacement:Boolean = true;
      
      private static var currentLang:String;
      
      private static var stringMapList:Object = new Object();
      
      private static var _xmlLoaded:Boolean = false;
       
      
      public function Locale()
      {
         super();
      }
      
      public static function get autoReplace() : Boolean
      {
         return autoReplacement;
      }
      
      public static function set autoReplace(param1:Boolean) : void
      {
         autoReplacement = param1;
      }
      
      public static function get languageCodeArray() : Array
      {
         var _loc2_:* = null;
         var _loc1_:Array = new Array();
         for(_loc2_ in xmlMap)
         {
            if(_loc2_)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public static function get stringIDArray() : Array
      {
         var _loc2_:* = null;
         var _loc1_:Array = new Array();
         for(_loc2_ in stringMap)
         {
            if(_loc2_ != "")
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public static function setFlaName(param1:String) : void
      {
         flaName = param1;
      }
      
      public static function getDefaultLang() : String
      {
         return defaultLang;
      }
      
      public static function setDefaultLang(param1:String) : void
      {
         defaultLang = param1;
      }
      
      public static function addXMLPath(param1:String, param2:String) : void
      {
         if(xmlMap[param1] == undefined)
         {
            xmlMap[param1] = new Array();
         }
         xmlMap[param1].push(param2);
      }
      
      public static function addDelayedInstance(param1:Object, param2:String) : *
      {
         var _loc3_:DisplayObjectContainer = null;
         var _loc4_:DisplayObject = null;
         var _loc5_:Dictionary = null;
         if(param1.hasOwnProperty("text"))
         {
            delayedInstanceDict[param1] = param2;
         }
         else if(param1.hasOwnProperty("parent") && param1.parent is DisplayObjectContainer && param1.hasOwnProperty("instanceName"))
         {
            _loc3_ = DisplayObjectContainer(param1.parent);
            _loc4_ = !!_loc3_.hasOwnProperty(param1.instanceName)?_loc3_[param1.instanceName] as DisplayObject:null;
            if(_loc4_ == null)
            {
               _loc4_ = _loc3_.getChildByName(param1.instanceName);
            }
            if(_loc4_ == null)
            {
               _loc5_ = delayedInstanceParentDict[_loc3_];
               if(_loc5_ == null)
               {
                  _loc5_ = delayedInstanceParentDict[_loc3_] = new Dictionary(false);
               }
               _loc5_[param1.instanceName] = param2;
               if(_xmlLoaded)
               {
                  _loc3_.addEventListener(Event.ADDED,addedListener);
               }
            }
            else if(_xmlLoaded)
            {
               if(_loc4_.hasOwnProperty("text"))
               {
                  _loc4_["text"] = loadString(param2);
               }
            }
            else
            {
               delayedInstanceDict[_loc4_] = param2;
            }
         }
      }
      
      public static function checkXMLStatus() : Boolean
      {
         return _xmlLoaded;
      }
      
      public static function setLoadCallback(param1:Function) : *
      {
         callback = param1;
      }
      
      public static function loadString(param1:String) : String
      {
         return stringMap[param1];
      }
      
      public static function loadStringEx(param1:String, param2:String) : String
      {
         var _loc3_:Object = stringMapList[param2];
         if(_loc3_)
         {
            return _loc3_[param1];
         }
         return "";
      }
      
      public static function setString(param1:String, param2:String, param3:String) : void
      {
         var _loc4_:Object = stringMapList[param2];
         if(_loc4_)
         {
            _loc4_[param1] = param3;
         }
         else
         {
            _loc4_ = new Object();
            _loc4_[param1] = param3;
            stringMapList[param2] = _loc4_;
         }
      }
      
      public static function initialize() : void
      {
         var _loc1_:String = xmlLang;
         if(xmlMap[xmlLang] == undefined)
         {
            _loc1_ = defaultLang;
         }
         currentXMLMapIndex = 0;
         loadXML(_loc1_);
      }
      
      public static function loadLanguageXML(param1:String, param2:Function = null) : void
      {
         var _loc3_:String = param1 == ""?Capabilities.language:param1;
         if(xmlMap[_loc3_] == undefined)
         {
            _loc3_ = defaultLang;
         }
         if(param2 != null)
         {
            callback = param2;
         }
         if(stringMapList[param1] == undefined)
         {
            loadXML(_loc3_);
         }
         else
         {
            stringMap = stringMapList[_loc3_];
            if(callback != null)
            {
               callback(true);
            }
         }
         currentLang = _loc3_;
      }
      
      private static function loadXML(param1:String) : *
      {
         var _loc2_:String = xmlMap[param1][0];
         var _loc3_:URLLoader = new URLLoader(new URLRequest(_loc2_));
         _loc3_.addEventListener("complete",onXMLLoad);
      }
      
      private static function onXMLLoad(param1:Event) : *
      {
         _xmlLoaded = true;
         var _loc2_:URLLoader = param1.target as URLLoader;
         var _loc3_:String = _loc2_.data;
         xmlDoc = new XMLDocument();
         xmlDoc.ignoreWhite = true;
         xmlDoc.parseXML(_loc3_);
         stringMap = new Object();
         parseStringsXML(xmlDoc);
         if(stringMapList[currentLang] == undefined)
         {
            stringMapList[currentLang] = stringMap;
         }
         if(autoReplacement)
         {
            assignDelayedInstances();
         }
         if(callback != null)
         {
            callback(true);
         }
      }
      
      private static function parseStringsXML(param1:XMLDocument) : void
      {
         if(param1.childNodes.length > 0 && param1.childNodes[0].nodeName == "xliff")
         {
            parseXLiff(param1.childNodes[0]);
         }
      }
      
      private static function parseXLiff(param1:XMLNode) : void
      {
         if(param1.childNodes.length > 0 && param1.childNodes[0].nodeName == "file")
         {
            parseFile(param1.childNodes[0]);
         }
      }
      
      private static function parseFile(param1:XMLNode) : void
      {
         if(param1.childNodes.length > 1 && param1.childNodes[1].nodeName == "body")
         {
            parseBody(param1.childNodes[1]);
         }
      }
      
      private static function parseBody(param1:XMLNode) : void
      {
         var _loc2_:Number = 0;
         while(_loc2_ < param1.childNodes.length)
         {
            if(param1.childNodes[_loc2_].nodeName == "trans-unit")
            {
               parseTransUnit(param1.childNodes[_loc2_]);
            }
            _loc2_++;
         }
      }
      
      private static function parseTransUnit(param1:XMLNode) : void
      {
         var _loc3_:String = null;
         var _loc2_:String = param1.attributes.resname;
         if(_loc2_.length > 0 && param1.childNodes.length > 0 && param1.childNodes[0].nodeName == "source")
         {
            _loc3_ = parseSource(param1.childNodes[0]);
            if(_loc3_.length > 0)
            {
               stringMap[_loc2_] = _loc3_;
            }
         }
      }
      
      private static function parseSource(param1:XMLNode) : String
      {
         if(param1.childNodes.length > 0)
         {
            return param1.childNodes[0].nodeValue;
         }
         return "";
      }
      
      private static function assignDelayedInstances() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:DisplayObjectContainer = null;
         var _loc4_:Dictionary = null;
         var _loc5_:Boolean = false;
         var _loc6_:String = null;
         var _loc7_:DisplayObject = null;
         var _loc8_:String = null;
         for(_loc1_ in delayedInstanceDict)
         {
            _loc1_.text = loadString(delayedInstanceDict[_loc1_]);
         }
         for(_loc1_ in delayedInstanceParentDict)
         {
            _loc3_ = DisplayObjectContainer(_loc1_);
            _loc4_ = delayedInstanceParentDict[_loc1_];
            for(_loc2_ in _loc4_)
            {
               _loc6_ = String(_loc2_);
               _loc7_ = !!_loc3_.hasOwnProperty(_loc6_)?_loc3_[_loc6_] as DisplayObject:null;
               if(_loc7_ == null)
               {
                  _loc7_ = _loc3_.getChildByName(_loc6_);
               }
               if(_loc7_ == null)
               {
                  _loc3_.addEventListener(Event.ADDED,addedListener);
               }
               else
               {
                  _loc8_ = _loc4_[_loc2_];
                  if(_loc7_.hasOwnProperty("text"))
                  {
                     _loc7_["text"] = loadString(_loc8_);
                  }
                  delete _loc4_[_loc2_];
               }
            }
            _loc5_ = true;
            for(_loc2_ in _loc4_)
            {
               _loc5_ = false;
            }
            if(_loc5_)
            {
               _loc3_.removeEventListener(Event.ADDED,addedListener);
               delete delayedInstanceParentDict[_loc1_];
            }
         }
      }
      
      private static function addedListener(param1:Event) : void
      {
         var _loc7_:* = undefined;
         var _loc2_:DisplayObjectContainer = param1.currentTarget as DisplayObjectContainer;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:DisplayObject = param1.target as DisplayObject;
         if(_loc3_ == null || _loc3_.parent != _loc2_)
         {
            return;
         }
         var _loc4_:Dictionary = delayedInstanceParentDict[_loc2_];
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:String = _loc4_[_loc3_.name];
         if(_loc5_ == null)
         {
            return;
         }
         if(_loc3_.hasOwnProperty("text"))
         {
            _loc3_["text"] = loadString(_loc5_);
         }
         delete _loc4_[_loc3_.name];
         var _loc6_:Boolean = true;
         for(_loc7_ in _loc4_)
         {
            _loc6_ = false;
         }
         if(_loc6_)
         {
            _loc2_.removeEventListener(Event.ADDED,addedListener);
            delete delayedInstanceParentDict[_loc7_];
         }
      }
   }
}
