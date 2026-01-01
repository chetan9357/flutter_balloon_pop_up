# 🎈 Balloon Popup

A lightweight and fully customizable **Balloon / Tooltip Popup library for Flutter**  
with smooth animations and flexible positioning.

Perfect for:
- Tooltips
- Help hints
- Info popups
- Feature highlights

---

## ✨ Features

✅ Top / Bottom / Left / Right popup positions  
✅ Smooth **Fade + Scale (Balloon-style)** animation  
✅ Fully customizable background & text style  
✅ Controller-based show / hide  
✅ Hot-restart safe  
✅ Clean & library-ready architecture  
✅ No external dependencies  

---

## 📦 Installation
### Add dependency in pubspec.yaml:
```yaml
dependencies:
  balloon_popup:
    path: '.../flutter_balloon_pop_up/balloon_popup'
```

### Using GitHub (Recommended during development)

```yaml
dependencies:
  balloon_popup:
    git:
      url: https://github.com/YOUR_USERNAME/balloon_popup.git
```

---

## 🚀 Quick Usage
```dart
import 'package:balloon_popup/balloon_popup.dart';

final controller = BalloonPopupController();

BalloonPopup(
  controller: controller,
  message: 'Hello Balloon 🎈',
  position: PopupPosition.top,
  backgroundColor: Colors.black,
  textStyle: const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
  ),
  child: ElevatedButton(
    onPressed: () {
      controller.show();
      Future.delayed(const Duration(seconds: 2), controller.hide);
    },
    child: const Text('Show Popup'),
  ),
);
```

---

## 📍 Supported Positions
| Position               |
| ---------------------- |
| `PopupPosition.top`    |
| `PopupPosition.bottom` |
| `PopupPosition.left`   |
| `PopupPosition.right`  |

---

## 🎨 Customization Options
| Property          | Description            |
| ----------------- | ---------------------- |
| `backgroundColor` | Popup background color |
| `textStyle`       | Message text style     |
| `padding`         | Inner spacing          |
| `borderRadius`    | Popup corner radius    |
| `position`        | Popup placement        |
| `controller`      | Show / hide control    |


---

## 🎞️ Demo
![demo](https://github.com/user-attachments/assets/8294a1b0-2a8d-4d31-ab98-c0d9b7e5ec80)

---

## 🧠 Controller Usage
```dart
final controller = BalloonPopupController();

controller.show();
controller.hide();
```

Each popup should use **its own controller** for correct lifecycle behavior.

---

## 📁 Package Structure
```text
lib/
├── balloon_popup.dart        # Public API
└── src/
    ├── balloon_popup_widget.dart
    ├── balloon_popup_controller.dart
    ├── balloon_arrow_painter.dart
    └── popup_position.dart
```

---

## 📄 License
```text
Copyright (c) 2025 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED **"AS IS"**, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```
