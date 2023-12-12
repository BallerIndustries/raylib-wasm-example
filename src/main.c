#include "raylib.h"

int main(void) {
    InitWindow(512, 512, "Raylib WASM Example");
    Texture2D texture = LoadTexture("resources/smile.png");

    while (!WindowShouldClose()) {
        BeginDrawing();
        ClearBackground(BLACK);
        DrawTexture(texture, 0, 0, WHITE);
        EndDrawing();
    }

    UnloadTexture(texture);
    CloseWindow();
    return 0;
}