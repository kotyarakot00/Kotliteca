# Kotliteca UI

Легковесная, быстрая и стабильная UI-библиотека для Roblox-скриптов (Luau).
Создана для удобного построения хабов, меню и чит-панелей. Имеет строгий Dark Dashboard дизайн, не ломается на бесплатных экзекуторах и легко подстраивается под любые модули.

---

## 🇷🇺 Русская версия

### 📦 Установка

Библиотека не требует скачивания файлов. Вы можете загрузить её напрямую через `loadstring`, используя ссылку Raw из этого репозитория.

```lua
local Kotliteca = loadstring(game:HttpGet("https://raw.githubusercontent.com/ВАШ_НИК/kotliteca-ui/main/Kotliteca.lua"))()
```
*(Не забудьте заменить `ВАШ_НИК` на ваш реальный никнейм на GitHub).*

### 🚀 Быстрый старт

Вот пример того, как создать окно, добавить вкладку и разместить на ней элементы управления:

```
local Kotliteca = loadstring(game:HttpGet("ССЫЛКА_НА_ВАШ_ФАЙЛ"))()

-- 1. Создаем главное окно
local Window = Kotliteca:CreateWindow({
    Title = "Kotliteca UI — Example"
})

-- 2. Создаем вкладки (они автоматически появятся в левом сайдбаре)
local MainTab = Window:CreateTab("Main")
local SettingsTab = Window:CreateTab("Settings")

-- 3. Добавляем кнопку
MainTab:AddButton({
    Name = "Нажми меня",
    Callback = function()
        print("Кнопка была нажата!")
    end
})

-- 4. Добавляем переключатель (Toggle)
MainTab:AddToggle({
    Name = "Бесконечный прыжок",
    Default = false, -- Состояние по умолчанию
    Callback = function(state)
        print("Бесконечный прыжок:", state)
    end
})
```

### 📖 Документация API

#### `Kotliteca:CreateWindow(config)`
Создает главное окно библиотеки.
* **config.Title** *(string)* — Заголовок окна (отображается в верхней панели).

#### `Window:CreateTab(name)`
Создает новую вкладку в левом меню.
* **name** *(string)* — Название вкладки (например, "Combat", "Visuals").

#### `Tab:AddButton(config)`
Добавляет кликабельную кнопку.
* **config.Name** *(string)* — Текст на кнопке.
* **config.Callback** *(function)* — Функция, которая выполнится при нажатии.

#### `Tab:AddToggle(config)`
Добавляет переключатель (вкл/выкл).
* **config.Name** *(string)* — Текст рядом с переключателем.
* **config.Default** *(boolean)* — Изначальное состояние (`true` или `false`).
* **config.Callback** *(function)* — Функция, которая получает `state` (`true`/`false`) при каждом переключении.

#### `Tab:AddSlider(config)`
Добавляет ползунок для выбора числового значения.
* **config.Name** *(string)* — Название слайдера.
* **config.Min** *(number)* — Минимальное значение.
* **config.Max** *(number)* — Максимальное значение.
* **config.Default** *(number)* — Значение по умолчанию.
* **config.Callback** *(function)* — Функция, которая получает новое значение (`value`) при движении ползунка.

#### `Tab:AddDropdown(config)`
Добавляет выпадающий список с опциями.
* **config.Name** *(string)* — Название списка.
* **config.Options** *(table)* — Таблица со строками (например, `{"Option 1", "Option 2"}`).
* **config.Callback** *(function)* — Функция, которая получает выбранную строку (`selectedOption`).

#### `Tab:AddTextbox(config)`
Добавляет поле для ввода текста.
* **config.Name** *(string)* — Название поля.
* **config.Placeholder** *(string)* — Текст-подсказка внутри поля.
* **config.Callback** *(function)* — Функция, которая получает введенный текст (`text`) при нажатии Enter.

#### `Window:Notify(config)`
Показывает всплывающее уведомление в правом нижнем углу.
* **config.Text** *(string)* — Текст уведомления.
* **config.Duration** *(number)* — Через сколько секунд исчезнет (по умолчанию 3).

### 🎨 Кастомизация
Вы можете легко изменить цвета библиотеки под свой стиль. Для этого откройте файл `Kotliteca.lua` и измените значения в таблице `Kotliteca.Theme` в самом верху файла:

```
Kotliteca.Theme = {
    Background = Color3.fromRGB(18, 19, 22),   -- Основной фон
    Surface    = Color3.fromRGB(26, 28, 33),   -- Фон панелей
    SurfaceLight = Color3.fromRGB(34, 37, 44), -- Фон кнопок
    Text       = Color3.fromRGB(235, 237, 240),-- Основной текст
    TextDim    = Color3.fromRGB(150, 155, 165),-- Тусклый текст
    Accent     = Color3.fromRGB(88, 130, 255), -- Акцентный цвет (синий)
    ToggleOff  = Color3.fromRGB(50, 53, 62),   -- Цвет выключенного тоггла
}
```

---

## 🇬🇧 English Version

### 📦 Installation

The library does not require downloading files. You can load it directly via `loadstring` using the Raw link from this repository.

```
local Kotliteca = loadstring(game:HttpGet("https://raw.githubusercontent.com/YOUR_NICKNAME/kotliteca-ui/main/Kotliteca.lua"))()
```

### 🚀 Quick Start

```
local Kotliteca = loadstring(game:HttpGet("YOUR_RAW_LINK"))()

local Window = Kotliteca:CreateWindow({
    Title = "Kotliteca UI — Example"
})

local MainTab = Window:CreateTab("Main")

MainTab:AddButton({
    Name = "Click Me",
    Callback = function()
        print("Button was clicked!")
    end
})

MainTab:AddToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(state)
        print("Infinite Jump:", state)
    end
})
```

### 📖 API Documentation

#### `Kotliteca:CreateWindow(config)`
* **config.Title** *(string)* — Window title.

#### `Window:CreateTab(name)`
* **name** *(string)* — Tab name.

#### `Tab:AddButton(config)`
* **config.Name** *(string)* — Button text.
* **config.Callback** *(function)* — Function executed when clicked.

#### `Tab:AddToggle(config)`
* **config.Name** *(string)* — Toggle text.
* **config.Default** *(boolean)* — Initial state.
* **config.Callback** *(function)* — Function receiving `state` (`true`/`false`).

#### `Tab:AddSlider(config)`
* **config.Name** *(string)* — Slider name.
* **config.Min** *(number)* — Minimum value.
* **config.Max** *(number)* — Maximum value.
* **config.Default** *(number)* — Default value.
* **config.Callback** *(function)* — Function receiving the new `value`.

#### `Tab:AddDropdown(config)`
* **config.Name** *(string)* — Dropdown name.
* **config.Options** *(table)* — Table of strings.
* **config.Callback** *(function)* — Function receiving the `selectedOption`.

#### `Tab:AddTextbox(config)`
* **config.Name** *(string)* — Field name.
* **config.Placeholder** *(string)* — Placeholder text.
* **config.Callback** *(function)* — Function receiving the `text` on Enter.

#### `Window:Notify(config)`
* **config.Text** *(string)* — Notification text.
* **config.Duration** *(number)* — Duration in seconds.

### 🎨 Customization
```
Kotliteca.Theme = {
    Background = Color3.fromRGB(18, 19, 22),
    Surface    = Color3.fromRGB(26, 28, 33),
    SurfaceLight = Color3.fromRGB(34, 37, 44),
    Text       = Color3.fromRGB(235, 237, 240),
    TextDim    = Color3.fromRGB(150, 155, 165),
    Accent     = Color3.fromRGB(88, 130, 255),
    ToggleOff  = Color3.fromRGB(50, 53, 62),
}
```
