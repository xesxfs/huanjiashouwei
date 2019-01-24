package com.reintroducing.sound
{
   import com.adobe.utils.StringUtil;
   import com.reintroducing.events.SoundManagerEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.media.Sound;
   import flash.media.SoundLoaderContext;
   import flash.net.URLRequest;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class SoundManager extends EventDispatcher
   {
      
      private static var _instance:SoundManager;
      
      private static var _allowInstance:Boolean;
       
      
      private var _soundsDict:Dictionary;
      
      private var _sounds:Array;
      
      private var _areAllMuted:Boolean;
      
      private var _areFxMuted:Boolean;
      
      private var _areMusicMuted:Boolean;
      
      private var _tempExternalSoundItem:SoundItem;
      
      private var _isPlayingSwords:Boolean = false;
      
      public function SoundManager()
      {
         super();
         this._soundsDict = new Dictionary(true);
         this._sounds = [];
         if(!_allowInstance)
         {
            throw new Error("Error: Use SoundManager.getInstance() instead of the new keyword.");
         }
      }
      
      public static function getInstance() : SoundManager
      {
         if(_instance == null)
         {
            _allowInstance = true;
            _instance = new SoundManager();
            _allowInstance = false;
         }
         return _instance;
      }
      
      public function muteFx() : void
      {
         this._areFxMuted = true;
      }
      
      public function unMuteFx() : void
      {
         this._areFxMuted = false;
      }
      
      public function muteMusic() : void
      {
         this._areMusicMuted = true;
      }
      
      public function unMuteMusic() : void
      {
         this._areMusicMuted = false;
      }
      
      private function addSound(param1:*, param2:Sound, param3:String, param4:String, param5:Number = 1000, param6:Boolean = false) : Boolean
      {
         var _loc9_:SoundItem = null;
         var _loc7_:int = this._sounds.length;
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            if((this._sounds[_loc8_] as SoundItem).name == param4)
            {
               return false;
            }
            _loc8_++;
         }
         _loc9_ = new SoundItem();
         if(param1 == null)
         {
            if(param2 == null)
            {
               _loc9_.sound = new Sound(new URLRequest(param3),new SoundLoaderContext(param5,param6));
               _loc9_.sound.addEventListener(IOErrorEvent.IO_ERROR,this.onSoundLoadError,false,0,true);
               _loc9_.sound.addEventListener(ProgressEvent.PROGRESS,this.onSoundLoadProgress,false,0,true);
               _loc9_.sound.addEventListener(Event.COMPLETE,this.onSoundLoadComplete,false,0,true);
               this._tempExternalSoundItem = _loc9_;
            }
            else
            {
               _loc9_.sound = param2;
            }
         }
         else
         {
            _loc9_.sound = new param1();
         }
         _loc9_.name = param4;
         _loc9_.position = 0;
         _loc9_.paused = true;
         _loc9_.volume = !!this._areAllMuted?Number(0):Number(1);
         _loc9_.savedVolume = _loc9_.volume;
         _loc9_.startTime = 0;
         _loc9_.loops = 0;
         _loc9_.pausedByAll = false;
         _loc9_.muted = this._areAllMuted;
         this._soundsDict[param4] = _loc9_;
         this._sounds.push(_loc9_);
         _loc9_ = null;
         return true;
      }
      
      public function addLibrarySound(param1:*, param2:String) : Boolean
      {
         return this.addSound(param1,null,"",param2);
      }
      
      public function addExternalSound(param1:String, param2:String, param3:Number = 1000, param4:Boolean = false) : Boolean
      {
         return this.addSound(null,null,param1,param2,param3,param4);
      }
      
      public function addPreloadedSound(param1:Sound, param2:String) : Boolean
      {
         return this.addSound(null,param1,"",param2);
      }
      
      public function removeSound(param1:String) : void
      {
         var _loc3_:SoundItem = null;
         var _loc2_:int = this._sounds.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = this._sounds[_loc4_] as SoundItem;
            if(_loc3_.name == param1)
            {
               _loc3_.sound.removeEventListener(IOErrorEvent.IO_ERROR,this.onSoundLoadError);
               _loc3_.sound.removeEventListener(ProgressEvent.PROGRESS,this.onSoundLoadProgress);
               _loc3_.sound.removeEventListener(Event.COMPLETE,this.onSoundLoadComplete);
               _loc3_.destroy();
               this._sounds[_loc4_] = null;
               this._sounds.splice(_loc4_,1);
               delete this._soundsDict[param1];
               _loc3_ = null;
               break;
            }
            _loc4_++;
         }
      }
      
      public function removeAllSounds() : void
      {
         var _loc2_:SoundItem = null;
         var _loc1_:int = this._sounds.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ = this._sounds[_loc3_] as SoundItem;
            _loc2_.sound.removeEventListener(IOErrorEvent.IO_ERROR,this.onSoundLoadError);
            _loc2_.sound.removeEventListener(ProgressEvent.PROGRESS,this.onSoundLoadProgress);
            _loc2_.sound.removeEventListener(Event.COMPLETE,this.onSoundLoadComplete);
            _loc3_++;
         }
         this._sounds = [];
         this._soundsDict = new Dictionary(true);
         dispatchEvent(new SoundManagerEvent(SoundManagerEvent.REMOVED_ALL));
      }
      
      public function removeAllTmpSounds() : void
      {
         var _loc1_:int = this._sounds.length;
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc1_)
         {
            if((this._sounds[_loc5_] as SoundItem).name.charAt(0) == "0" || (this._sounds[_loc5_] as SoundItem).name.charAt(0) == "1")
            {
               _loc4_.push((this._sounds[_loc5_] as SoundItem).name);
            }
            _loc5_++;
         }
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_.length)
         {
            this.removeSound(_loc4_[_loc6_]);
            _loc6_++;
         }
      }
      
      private function isMusicSound(param1:String) : Boolean
      {
         if(StringUtil.beginsWith(param1,"music_"))
         {
            return true;
         }
         return false;
      }
      
      private function isFxSound(param1:String) : Boolean
      {
         if(StringUtil.beginsWith(param1,"music_"))
         {
            return false;
         }
         return true;
      }
      
      public function playSound(param1:String, param2:Number = 1, param3:Number = 0, param4:int = 0, param5:Boolean = true) : void
      {
         var _loc6_:int = this._sounds.length;
         var _loc7_:Boolean = false;
         var _loc8_:int = 0;
         while(_loc8_ < _loc6_)
         {
            if((this._sounds[_loc8_] as SoundItem).name == param1)
            {
               _loc7_ = true;
               break;
            }
            _loc8_++;
         }
         if(!_loc7_)
         {
            return;
         }
         if(this._areAllMuted)
         {
            param2 = 0;
         }
         else if(this._areFxMuted)
         {
            if(this.isFxSound(param1))
            {
               param2 = 0;
            }
         }
         if(this._areMusicMuted)
         {
            if(this.isMusicSound(param1))
            {
               param2 = 0;
            }
         }
         var _loc9_:SoundItem = this._soundsDict[param1] as SoundItem;
         if(_loc9_.channel != null)
         {
            _loc9_.play(param3,param4,param2,param5);
            dispatchEvent(new SoundManagerEvent(SoundManagerEvent.SOUND_ITEM_PLAY_START,_loc9_));
         }
         else
         {
            _loc9_.destroy();
         }
      }
      
      public function pauseSound(param1:String, param2:Boolean = true) : void
      {
         var _loc3_:SoundItem = this._soundsDict[param1] as SoundItem;
         _loc3_.pause(param2);
         dispatchEvent(new SoundManagerEvent(SoundManagerEvent.SOUND_ITEM_PAUSE,_loc3_));
      }
      
      public function isSoundSoldierFighting() : Boolean
      {
         return this._isPlayingSwords;
      }
      
      public function setPlayingSwords(param1:Boolean) : void
      {
         this._isPlayingSwords = param1;
      }
      
      public function stopSound(param1:String) : void
      {
         var _loc2_:SoundItem = this._soundsDict[param1] as SoundItem;
         _loc2_.stop();
         dispatchEvent(new SoundManagerEvent(SoundManagerEvent.SOUND_ITEM_STOP,_loc2_));
      }
      
      public function hasSound(param1:String) : Boolean
      {
         var _loc4_:String = null;
         var _loc2_:int = this._sounds.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = (this._sounds[_loc3_] as SoundItem).name;
            if(_loc4_ == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function playAllSounds(param1:Boolean = true, param2:Boolean = false) : void
      {
         var _loc5_:String = null;
         var _loc3_:int = this._sounds.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = (this._sounds[_loc4_] as SoundItem).name;
            if(param2)
            {
               if((this._soundsDict[_loc5_] as SoundItem).pausedByAll)
               {
                  (this._soundsDict[_loc5_] as SoundItem).pausedByAll = false;
                  this.playSound(_loc5_,(this._soundsDict[_loc5_] as SoundItem).volume,0,0,param1);
               }
            }
            else
            {
               this.playSound(_loc5_,(this._soundsDict[_loc5_] as SoundItem).volume,0,0,param1);
            }
            _loc4_++;
         }
         dispatchEvent(new SoundManagerEvent(SoundManagerEvent.PLAY_ALL));
      }
      
      public function pauseAllSounds(param1:Boolean = true, param2:Boolean = true) : void
      {
         var _loc5_:String = null;
         var _loc3_:int = this._sounds.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = (this._sounds[_loc4_] as SoundItem).name;
            if(param2)
            {
               if(!(this._soundsDict[_loc5_] as SoundItem).paused)
               {
                  (this._soundsDict[_loc5_] as SoundItem).pausedByAll = true;
                  this.pauseSound(_loc5_,param1);
               }
            }
            else
            {
               this.pauseSound(_loc5_,param1);
            }
            _loc4_++;
         }
         dispatchEvent(new SoundManagerEvent(SoundManagerEvent.PAUSE_ALL));
      }
      
      public function stopAllSounds(param1:Boolean = true) : void
      {
         var _loc4_:String = null;
         var _loc2_:int = this._sounds.length;
         this._isPlayingSwords = false;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = (this._sounds[_loc3_] as SoundItem).name;
            if(param1)
            {
               if(!(this._soundsDict[_loc4_] as SoundItem).paused)
               {
                  (this._soundsDict[_loc4_] as SoundItem).pausedByAll = true;
                  this.stopSound(_loc4_);
               }
            }
            else
            {
               this.stopSound(_loc4_);
            }
            _loc3_++;
         }
         dispatchEvent(new SoundManagerEvent(SoundManagerEvent.STOP_ALL));
      }
      
      public function stopAllFxSounds(param1:Boolean = true) : void
      {
         var _loc4_:String = null;
         var _loc2_:int = this._sounds.length;
         this._isPlayingSwords = false;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = (this._sounds[_loc3_] as SoundItem).name;
            if(!StringUtil.beginsWith(_loc4_,"music_"))
            {
               if(param1)
               {
                  if(!(this._soundsDict[_loc4_] as SoundItem).paused)
                  {
                     (this._soundsDict[_loc4_] as SoundItem).pausedByAll = true;
                     this.stopSound(_loc4_);
                  }
               }
               else
               {
                  this.stopSound(_loc4_);
               }
            }
            _loc3_++;
         }
         dispatchEvent(new SoundManagerEvent(SoundManagerEvent.STOP_ALL));
      }
      
      public function fadeSound(param1:String, param2:Number = 0, param3:Number = 1, param4:Boolean = false) : void
      {
         var _loc5_:SoundItem = this._soundsDict[param1] as SoundItem;
         _loc5_.addEventListener(SoundManagerEvent.SOUND_ITEM_FADE_COMPLETE,this.handleFadeComplete,false,0,true);
         _loc5_.fade(param2,param3,param4);
         dispatchEvent(new SoundManagerEvent(SoundManagerEvent.SOUND_ITEM_FADE,_loc5_));
      }
      
      public function muteAllSounds() : void
      {
         var _loc2_:String = null;
         var _loc3_:SoundItem = null;
         this._areAllMuted = true;
         var _loc1_:int = this._sounds.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_)
         {
            _loc2_ = (this._sounds[_loc4_] as SoundItem).name;
            _loc3_ = this._soundsDict[_loc2_] as SoundItem;
            _loc3_.savedVolume = _loc3_.channel.soundTransform.volume;
            _loc3_.muted = true;
            this.setSoundVolume(_loc2_,0);
            _loc4_++;
         }
         dispatchEvent(new SoundManagerEvent(SoundManagerEvent.MUTE_ALL));
      }
      
      public function unmuteAllSounds() : void
      {
         var _loc2_:String = null;
         var _loc3_:SoundItem = null;
         this._areAllMuted = false;
         var _loc1_:int = this._sounds.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_)
         {
            _loc2_ = (this._sounds[_loc4_] as SoundItem).name;
            _loc3_ = this._soundsDict[_loc2_] as SoundItem;
            _loc3_.muted = false;
            this.setSoundVolume(_loc2_,_loc3_.savedVolume);
            _loc4_++;
         }
         dispatchEvent(new SoundManagerEvent(SoundManagerEvent.UNMUTE_ALL));
      }
      
      public function setSoundVolume(param1:String, param2:Number) : void
      {
         (this._soundsDict[param1] as SoundItem).setVolume(param2);
      }
      
      public function getSoundVolume(param1:String) : Number
      {
         return (this._soundsDict[param1] as SoundItem).channel.soundTransform.volume;
      }
      
      public function getSoundPosition(param1:String) : Number
      {
         return (this._soundsDict[param1] as SoundItem).channel.position;
      }
      
      public function getSoundDuration(param1:String) : Number
      {
         return (this._soundsDict[param1] as SoundItem).sound.length;
      }
      
      public function getSoundItem(param1:String) : SoundItem
      {
         return this._soundsDict[param1] as SoundItem;
      }
      
      public function isSoundPaused(param1:String) : Boolean
      {
         return (this._soundsDict[param1] as SoundItem).paused;
      }
      
      public function isSoundPausedByAll(param1:String) : Boolean
      {
         return (this._soundsDict[param1] as SoundItem).pausedByAll;
      }
      
      private function onSoundLoadError(param1:IOErrorEvent) : void
      {
         this._tempExternalSoundItem = null;
         dispatchEvent(new SoundManagerEvent(SoundManagerEvent.SOUND_ITEM_LOAD_ERROR));
      }
      
      private function onSoundLoadProgress(param1:ProgressEvent) : void
      {
         var _loc2_:uint = Math.round(100 * (param1.bytesLoaded / param1.bytesTotal));
         var _loc3_:Sound = param1.target as Sound;
         var _loc4_:Number = 0;
         if(_loc3_ && _loc3_.length > 0)
         {
            _loc4_ = _loc3_.bytesTotal / (_loc3_.bytesLoaded / _loc3_.length) * 0.001;
         }
         dispatchEvent(new SoundManagerEvent(SoundManagerEvent.SOUND_ITEM_LOAD_PROGRESS,this._tempExternalSoundItem,_loc4_,_loc2_));
      }
      
      private function onSoundLoadComplete(param1:Event) : void
      {
         var _loc2_:Sound = param1.target as Sound;
         var _loc3_:Number = _loc2_.length * 0.001;
         dispatchEvent(new SoundManagerEvent(SoundManagerEvent.SOUND_ITEM_LOAD_COMPLETE,this._tempExternalSoundItem,_loc3_));
         this._tempExternalSoundItem = null;
      }
      
      private function handleFadeComplete(param1:SoundManagerEvent) : void
      {
         dispatchEvent(param1);
         var _loc2_:SoundItem = param1.soundItem;
         _loc2_.removeEventListener(SoundManagerEvent.SOUND_ITEM_FADE_COMPLETE,this.handleFadeComplete);
      }
      
      private function handleSoundPlayComplete(param1:SoundManagerEvent) : void
      {
         dispatchEvent(param1);
      }
      
      public function get sounds() : Array
      {
         return this._sounds;
      }
      
      public function get areAllMuted() : Boolean
      {
         return this._areAllMuted;
      }
      
      override public function toString() : String
      {
         return getQualifiedClassName(this);
      }
   }
}
