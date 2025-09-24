
# 📱 Fatos Inúteis

Um app simples feito em Flutter para exibir fatos aleatórios e inúteis — mas divertidos! O app traduz automaticamente os fatos para português e é uma oportunidade prática para estudar **Flutter**, **Riverpod** e **Clean Architecture** em um projeto real.

## ✨ Funcionalidades

- 🔄 Busca de fatos inúteis aleatórios a partir da API [Useless Facts](https://uselessfacts.jsph.pl/)
- 🌐 Tradução automática dos fatos para o português com `translator`
- 🎨 Suporte a tema claro/escuro com troca dinâmica
- 🔗 Botão para compartilhar o fato ou abrir links
- 🧠 Projeto voltado para estudos com boas práticas de arquitetura e estado

## 🧱 Arquitetura

O app segue os princípios da **Clean Architecture**, com separação clara de camadas:

```
lib/
├── core/              # Tema, falhas, utils
├── features/
│   └── fact/          # Feature principal com suas camadas
│       ├── data/      # Repositórios e fontes de dados
│       ├── domain/    # Entidades e UseCases
│       ├── presentation/ # UI e providers
├── di/                # Configuração do get_it
├── main.dart
```

## 🧰 Tecnologias e pacotes

O projeto utiliza as seguintes dependências principais:

| Pacote           | Função principal                              |
|------------------|-----------------------------------------------|
| `flutter_riverpod` | Gerenciamento de estado moderno com reatividade |
| `riverpod`         | (base do flutter_riverpod) para lógica compartilhada |
| `get_it`           | Injeção de dependência simples e eficiente    |
| `http`             | Requisições HTTP para APIs                    |
| `translator`       | Tradução automática de texto com Google Translate |
| `url_launcher`     | Abertura de links externos e compartilhamento |

## 🚀 Como rodar

Clone o repositório e execute:

```bash
flutter pub get
flutter run
```

> Obs: é necessário ter o Flutter instalado. Saiba mais em [flutter.dev](https://flutter.dev).

## 🧪 Objetivo do projeto

Este é um app **experimental e educativo**, idealizado para estudar boas práticas com Flutter e explorar o uso de pacotes úteis em um cenário real. Ele serve como base para projetos maiores com múltiplas features, temas e internacionalização.

---

Feito com 💙 por Marcos Bergamasco
