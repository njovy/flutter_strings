package com.njovy.plugins.strings;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import java.util.List;

/**
 * StringsPlugin
 */
public class StringsPlugin implements MethodCallHandler {

  private final PluginRegistry.Registrar registrar;

  public StringsPlugin(Registrar registrar) {
    this.registrar = registrar;
  }

  private static final String CHANNEL = "plugins.njovy.com/strings";

  /**
   * Plugin registration.
   */
  public static void registerWith(Registrar registrar) {
    if (registrar.activity() == null) {
      // If a background flutter view tries to register the plugin, there will be no activity from the registrar,
      // we stop the registering process immediately because the ImagePicker requires an activity.
      return;
    }
    final MethodChannel channel = new MethodChannel(registrar.messenger(), CHANNEL);
    channel.setMethodCallHandler(new StringsPlugin(registrar));
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (registrar.activity() == null) {
      result.success(null);
      return;
    }
    if (call.method.equals("getString")) {
      String key = call.argument("key");
      List<Object> args = call.argument("args");
      int resId = registrar.context()
          .getResources()
          .getIdentifier(key, "string", registrar.context().getPackageName());
      if (resId != 0) {
        result.success(registrar.context()
            .getString(resId, args != null ? args.toArray() : null));
      } else {
        result.success(key);
      }
    } else {
      result.notImplemented();
    }
  }
}
