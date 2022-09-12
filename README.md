# mobx_test

Mobx test app

## Dev
In order to work will stores in MobX, we are required to run an external command into the terminal which will build the store for us. The command for that is:

```bash
flutter pub run build_runner build

# stay on watch
flutter pub run build_runner watch

# Starting Clean
flutter pub run build_runner watch --delete-conflicting-outputs
```
