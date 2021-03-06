//
//  Palette.swift
//  Gradual
//
//  Created by Nicky Marino on 9/24/20.
//  Copyright © 2020 Nicky Marino. All rights reserved.
//

import Foundation
import SwiftUI

class Palette: ObservableObject {
    @Published var colors = [Color.orange, Color.blue]

    init() {
        shuffle()
    }

    func shuffle() {
        let oldIndex = colorIndex
        repeat {
            colorIndex = Int.random(in: 0..<colorSets.count)
        } while (oldIndex == colorIndex)

        colors = colorSets[colorIndex]
    }

    // MARK: Private Implementation

    private var colorIndex = 0
    private let colorSets = [
        [Color.pink, Color.yellow],
        [Color.red, Color.purple],
        [Color.green, Color.white],
        [Color.purple, Color.black],
        [Color.pink, Color.red],
        [Color.black, Color.blue],
        [Color.yellow, Color.orange],
        [Color.gray, Color.black],
        [Color.red, Color.orange],
        [Color(red:   0 / 255, green: 255 / 255, blue: 135 / 255), Color(red:  96 / 255, green: 239 / 255, blue: 255 / 255)],
        [Color(red:   0 / 255, green:  97 / 255, blue: 255 / 255), Color(red:  96 / 255, green: 239 / 255, blue: 255 / 255)],
        [Color(red: 255 / 255, green:  27 / 255, blue: 107 / 255), Color(red:  69 / 255, green: 202 / 255, blue: 255 / 255)],
        [Color(red:  64 / 255, green: 201 / 255, blue: 255 / 255), Color(red: 232 / 255, green:  28 / 255, blue: 255 / 255)],
        [Color(red: 255 / 255, green: 147 / 255, blue:  15 / 255), Color(red: 255 / 255, green: 249 / 255, blue:  91 / 255)],
        [Color(red: 255 / 255, green:  15 / 255, blue: 123 / 255), Color(red: 248 / 255, green: 155 / 255, blue:  41 / 255)],
        [Color(red: 191 / 255, green:  15 / 255, blue: 255 / 255), Color(red: 203 / 255, green: 255 / 255, blue:  73 / 255)],
        [Color(red: 105 / 255, green: 110 / 255, blue: 255 / 255), Color(red: 248 / 255, green: 172 / 255, blue: 255 / 255)],
        [Color(red: 169 / 255, green: 255 / 255, blue: 104 / 255), Color(red: 255 / 255, green: 137 / 255, blue: 137 / 255)],
        [Color(red: 255 / 255, green:  88 / 255, blue:  88 / 255), Color(red: 255 / 255, green: 200 / 255, blue: 200 / 255)],
        [Color(red:  89 / 255, green:  92 / 255, blue: 255 / 255), Color(red: 198 / 255, green: 248 / 255, blue: 255 / 255)],
        [Color(red: 255 / 255, green: 165 / 255, blue: 133 / 255), Color(red: 255 / 255, green: 237 / 255, blue: 160 / 255)],
        [Color(red: 132 / 255, green: 255 / 255, blue: 201 / 255), Color(red: 170 / 255, green: 178 / 255, blue: 255 / 255), Color(red: 236 / 255, green: 160 / 255, blue: 255 / 255)],
        [Color(red: 239 / 255, green: 112 / 255, blue: 155 / 255), Color(red: 250 / 255, green: 147 / 255, blue: 114 / 255)],
        [Color(red: 178 / 255, green: 239 / 255, blue: 145 / 255), Color(red: 250 / 255, green: 147 / 255, blue: 114 / 255)],
        [Color(red: 155 / 255, green: 248 / 255, blue: 244 / 255), Color(red: 111 / 255, green: 123 / 255, blue: 247 / 255)],
        [Color(red: 249 / 255, green: 197 / 255, blue: 141 / 255), Color(red: 244 / 255, green: 146 / 255, blue: 240 / 255)],
        [Color(red: 244 / 255, green: 146 / 255, blue: 240 / 255), Color(red: 161 / 255, green: 141 / 255, blue: 206 / 255)],
        [Color(red: 249 / 255, green: 177 / 255, blue: 110 / 255), Color(red: 246 / 255, green: 128 / 255, blue: 128 / 255)],
        [Color(red: 155 / 255, green: 175 / 255, blue: 217 / 255), Color(red:  16 / 255, green:  55 / 255, blue: 131 / 255)],
        [Color(red: 251 / 255, green: 208 / 255, blue: 124 / 255), Color(red: 247 / 255, green: 247 / 255, blue: 121 / 255)],
        [Color(red: 197 / 255, green: 249 / 255, blue: 215 / 255), Color(red: 247 / 255, green: 212 / 255, blue: 134 / 255), Color(red: 242 / 255, green: 122 / 255, blue: 125 / 255)],
        [Color(red: 235 / 255, green: 244 / 255, blue: 245 / 255), Color(red: 181 / 255, green: 198 / 255, blue: 224 / 255)],
        [Color(red: 246 / 255, green: 213 / 255, blue: 247 / 255), Color(red: 251 / 255, green: 233 / 255, blue: 215 / 255)],
        [Color(red:  67 / 255, green:  35 / 255, blue: 113 / 255), Color(red: 250 / 255, green: 174 / 255, blue: 123 / 255)],
        [Color(red: 233 / 255, green: 183 / 255, blue: 206 / 255), Color(red: 211 / 255, green: 243 / 255, blue: 241 / 255)],
        [Color(red:  67 / 255, green: 156 / 255, blue: 251 / 255), Color(red: 241 / 255, green: 135 / 255, blue: 251 / 255)],
        [Color(red:  29 / 255, green: 189 / 255, blue: 230 / 255), Color(red: 241 / 255, green:  81 / 255, blue:  94 / 255)],
        [Color(red:  87 / 255, green: 235 / 255, blue: 222 / 255), Color(red: 174 / 255, green: 251 / 255, blue:  42 / 255)],
        [Color(red:  66 / 255, green:   4 / 255, blue: 126 / 255), Color(red:   7 / 255, green: 244 / 255, blue: 158 / 255)],
        [Color(red: 244 / 255, green: 242 / 255, blue: 105 / 255), Color(red:  92 / 255, green: 178 / 255, blue: 112 / 255)],
        [Color(red: 177 / 255, green: 144 / 255, blue: 186 / 255), Color(red: 232 / 255, green: 181 / 255, blue: 149 / 255)],
        [Color(red: 181 / 255, green: 151 / 255, blue: 246 / 255), Color(red: 150 / 255, green: 198 / 255, blue: 234 / 255)],
        [Color(red: 201 / 255, green: 222 / 255, blue: 244 / 255), Color(red: 245 / 255, green: 204 / 255, blue: 212 / 255), Color(red: 184 / 255, green: 164 / 255, blue: 201 / 255)],
        [Color(red: 124 / 255, green: 101 / 255, blue: 169 / 255), Color(red: 150 / 255, green: 212 / 255, blue: 202 / 255)],
        [Color(red: 246 / 255, green: 207 / 255, blue: 190 / 255), Color(red: 185 / 255, green: 220 / 255, blue: 242 / 255)],
        [Color(red: 202 / 255, green: 239 / 255, blue: 215 / 255), Color(red: 245 / 255, green: 191 / 255, blue: 215 / 255), Color(red: 171 / 255, green: 201 / 255, blue: 233 / 255)],
        [Color(red: 159 / 255, green: 204 / 255, blue: 250 / 255), Color(red:   9 / 255, green: 116 / 255, blue: 241 / 255)],
        [Color(red: 255 / 255, green: 184 / 255, blue: 142 / 255), Color(red: 234 / 255, green:  87 / 255, blue:  83 / 255)],
        [Color(red: 211 / 255, green: 151 / 255, blue: 250 / 255), Color(red: 131 / 255, green: 100 / 255, blue: 232 / 255)],
        [Color(red: 141 / 255, green: 233 / 255, blue: 213 / 255), Color(red:  50 / 255, green: 196 / 255, blue: 192 / 255)],
        [Color(red: 245 / 255, green: 230 / 255, blue: 173 / 255), Color(red: 241 / 255, green:  60 / 255, blue: 119 / 255)],
        [Color(red: 130 / 255, green: 244 / 255, blue: 177 / 255), Color(red:  48 / 255, green: 198 / 255, blue: 124 / 255)],
        [Color(red: 212 / 255, green: 172 / 255, blue: 251 / 255), Color(red: 184 / 255, green:  79 / 255, blue: 206 / 255)],
        [Color(red: 247 / 255, green: 186 / 255, blue:  44 / 255), Color(red: 234 / 255, green:  84 / 255, blue:  89 / 255)],
        [Color(red:  97 / 255, green: 244 / 255, blue: 222 / 255), Color(red: 110 / 255, green: 120 / 255, blue: 255 / 255)],
        [Color(red: 255 / 255, green: 203 / 255, blue: 107 / 255), Color(red:  61 / 255, green: 139 / 255, blue: 255 / 255)],
        [Color(red: 168 / 255, green: 243 / 255, blue: 104 / 255), Color(red: 249 / 255, green:   3 / 255, blue:  94 / 255)],
        [Color(red: 245 / 255, green: 201 / 255, blue:   0 / 255), Color(red:  24 / 255, green:  49 / 255, blue: 130 / 255)],
        [Color(red: 255 / 255, green: 207 / 255, blue: 103 / 255), Color(red: 211 / 255, green:  50 / 255, blue:  29 / 255)],
        [Color(red: 149 / 255, green: 249 / 255, blue: 195 / 255), Color(red:  11 / 255, green:  56 / 255, blue: 102 / 255)],
        [Color(red:  77 / 255, green: 201 / 255, blue: 230 / 255), Color(red:  33 / 255, green:  12 / 255, blue: 174 / 255)],
        [Color(red: 238 / 255, green: 184 / 255, blue: 109 / 255), Color(red: 153 / 255, green:  70 / 255, blue: 178 / 255)],
        [Color(red: 217 / 255, green: 207 / 255, blue: 121 / 255), Color(red:  86 / 255, green:  18 / 255, blue: 214 / 255)],
        [Color(red: 226 / 255, green: 219 / 255, blue:  31 / 255), Color(red: 174 / 255, green:  16 / 255, blue: 249 / 255)],
        [Color(red: 126 / 255, green: 242 / 255, blue: 157 / 255), Color(red:  15 / 255, green: 104 / 255, blue: 169 / 255)],
        [Color(red: 233 / 255, green: 208 / 255, blue:  34 / 255), Color(red: 230 / 255, green:  11 / 255, blue:   9 / 255)],
        [Color(red: 255 / 255, green: 251 / 255, blue: 175 / 255), Color(red: 171 / 255, green:  42 / 255, blue: 237 / 255)],
        [Color(red: 255 / 255, green: 239 / 255, blue: 193 / 255), Color(red: 135 / 255, green:  79 / 255, blue: 158 / 255)],
        [Color(red: 239 / 255, green: 116 / 255, blue:  92 / 255), Color(red:  52 / 255, green:   7 / 255, blue:  61 / 255)],
        [Color(red: 250 / 255, green: 255 / 255, blue: 137 / 255), Color(red: 234 / 255, green: 114 / 255, blue: 173 / 255)],
        [Color(red: 145 / 255, green: 155 / 255, blue: 255 / 255), Color(red:  19 / 255, green:  58 / 255, blue: 148 / 255)],
        [Color(red: 222 / 255, green: 184 / 255, blue: 245 / 255), Color(red: 186 / 255, green:  66 / 255, blue: 192 / 255)],
        [Color(red: 243 / 255, green: 245 / 255, blue:  32 / 255), Color(red:  89 / 255, green: 209 / 255, blue:   2 / 255)],
        [Color(red: 234 / 255, green: 152 / 255, blue: 218 / 255), Color(red:  91 / 255, green: 108 / 255, blue: 249 / 255)],
        [Color(red: 255 / 255, green: 202 / 255, blue: 166 / 255), Color(red: 248 / 255, green: 101 / 255, blue: 148 / 255)],
        [Color(red: 182 / 255, green: 243 / 255, blue: 201 / 255), Color(red:  71 / 255, green: 102 / 255, blue: 244 / 255)],
        [Color(red: 243 / 255, green: 105 / 255, blue: 110 / 255), Color(red: 248 / 255, green: 169 / 255, blue:   2 / 255)],
        [Color(red: 111 / 255, green: 247 / 255, blue: 232 / 255), Color(red:  31 / 255, green: 126 / 255, blue: 161 / 255)],
        [Color(red: 244 / 255, green: 233 / 255, blue:   0 / 255), Color(red:  96 / 255, green: 182 / 255, blue: 241 / 255)],
        [Color(red: 255 / 255, green: 215 / 255, blue: 138 / 255), Color(red: 244 / 255, green: 118 / 255, blue:  45 / 255)],
        [Color(red: 255 / 255, green: 168 / 255, blue: 189 / 255), Color(red:  36 / 255, green:  42 / 255, blue: 207 / 255)],
        [Color(red: 248 / 255, green: 153 / 255, blue: 125 / 255), Color(red: 173 / 255, green:  51 / 255, blue: 109 / 255)],
        [Color(red: 111 / 255, green: 227 / 255, blue: 225 / 255), Color(red:  82 / 255, green:  87 / 255, blue: 229 / 255)],
        [Color(red: 249 / 255, green: 164 / 255, blue: 112 / 255), Color(red: 188 / 255, green:  85 / 255, blue: 111 / 255)],
        [Color(red: 237 / 255, green: 227 / 255, blue:  66 / 255), Color(red: 255 / 255, green:  81 / 255, blue: 235 / 255)],
        [Color(red: 110 / 255, green: 241 / 255, blue: 149 / 255), Color(red:   0 / 255, green: 227 / 255, blue: 253 / 255)],
        [Color(red:  57 / 255, green:  45 / 255, blue: 105 / 255), Color(red: 181 / 255, green: 123 / 255, blue: 238 / 255)],
        [Color(red: 110 / 255, green: 238 / 255, blue: 135 / 255), Color(red:  95 / 255, green: 197 / 255, blue:  46 / 255)],
        [Color(red: 252 / 255, green: 176 / 255, blue: 243 / 255), Color(red:  61 / 255, green:   5 / 255, blue: 221 / 255)],
        [Color(red: 131 / 255, green: 245 / 255, blue: 229 / 255), Color(red: 231 / 255, green:  97 / 255, blue: 189 / 255)],
        [Color(red: 247 / 255, green: 162 / 255, blue: 161 / 255), Color(red: 255 / 255, green: 237 / 255, blue:   0 / 255)],
        [Color(red: 248 / 255, green: 207 / 255, blue: 106 / 255), Color(red:  33 / 255, green: 120 / 255, blue: 221 / 255)],
        [Color(red: 248 / 255, green: 153 / 255, blue: 153 / 255), Color(red: 246 / 255, green: 192 / 255, blue: 186 / 255)],
        [Color(red: 157 / 255, green: 128 / 255, blue: 203 / 255), Color(red: 247 / 255, green: 194 / 255, blue: 230 / 255)],
        [Color(red: 249 / 255, green: 205 / 255, blue: 195 / 255), Color(red: 250 / 255, green: 206 / 255, blue: 251 / 255)],
        [Color(red: 241 / 255, green: 225 / 255, blue: 194 / 255), Color(red: 252 / 255, green: 188 / 255, blue: 152 / 255)],
        [Color(red: 247 / 255, green: 192 / 255, blue: 236 / 255), Color(red: 167 / 255, green: 189 / 255, blue: 234 / 255)],
        [Color(red: 246 / 255, green: 196 / 255, blue: 237 / 255), Color(red: 225 / 255, green: 218 / 255, blue: 230 / 255)],
        [Color(red: 135 / 255, green: 244 / 255, blue: 181 / 255), Color(red: 147 / 255, green: 203 / 255, blue: 241 / 255)],
        [Color(red: 221 / 255, green: 180 / 255, blue: 246 / 255), Color(red: 141 / 255, green: 208 / 255, blue: 252 / 255)],
        [Color(red: 242 / 255, green: 146 / 255, blue: 237 / 255), Color(red: 243 / 255, green:  99 / 255, blue: 100 / 255)],
        [Color(red:  90 / 255, green: 178 / 255, blue: 247 / 255), Color(red:  18 / 255, green: 207 / 255, blue: 243 / 255)],
        [Color(red: 248 / 255, green: 108 / 255, blue: 167 / 255), Color(red: 244 / 255, green: 212 / 255, blue:  68 / 255)],
        [Color(red:  48 / 255, green: 197 / 255, blue: 210 / 255), Color(red:  71 / 255, green:  16 / 255, blue: 105 / 255)],
        [Color(red:  98 / 255, green: 116 / 255, blue: 231 / 255), Color(red: 135 / 255, green:  82 / 255, blue: 163 / 255)],
        [Color(red: 238 / 255, green: 217 / 255, blue: 145 / 255), Color(red: 204 / 255, green: 247 / 255, blue: 244 / 255)],
        [Color(red: 148 / 255, green: 145 / 255, blue: 226 / 255), Color(red: 175 / 255, green: 242 / 255, blue: 216 / 255)],
        [Color(red: 232 / 255, green: 189 / 255, blue: 249 / 255), Color(red: 216 / 255, green: 222 / 255, blue: 214 / 255)],
        [Color(red: 149 / 255, green: 236 / 255, blue: 176 / 255), Color(red: 243 / 255, green: 249 / 255, blue: 138 / 255)],
        [Color(red:  47 / 255, green: 234 / 255, blue: 168 / 255), Color(red:   2 / 255, green: 140 / 255, blue: 243 / 255)],
        [Color(red: 135 / 255, green:  17 / 255, blue: 193 / 255), Color(red:  36 / 255, green: 114 / 255, blue: 252 / 255)],
        [Color(red: 196 / 255, green: 113 / 255, blue: 242 / 255), Color(red: 247 / 255, green: 108 / 255, blue: 198 / 255)],
        [Color(red:  69 / 255, green: 205 / 255, blue: 233 / 255), Color(red: 122 / 255, green: 143 / 255, blue: 211 / 255)],
        [Color(red:   9 / 255, green: 151 / 255, blue: 115 / 255), Color(red:  67 / 255, green: 182 / 255, blue: 146 / 255)],
        [Color(red:   7 / 255, green: 200 / 255, blue: 249 / 255), Color(red:  13 / 255, green:  65 / 255, blue: 225 / 255)],
        [Color(red: 109 / 255, green: 144 / 255, blue: 185 / 255), Color(red: 187 / 255, green: 199 / 255, blue: 220 / 255)],
        [Color(red: 155 / 255, green: 178 / 255, blue: 229 / 255), Color(red: 105 / 255, green: 140 / 255, blue: 191 / 255)],
        [Color(red: 244 / 255, green:  67 / 255, blue: 105 / 255), Color(red:  62 / 255, green:  59 / 255, blue: 146 / 255)],
        [Color(red:   9 / 255, green: 101 / 255, blue: 192 / 255), Color(red: 197 / 255, green:  58 / 255, blue: 148 / 255)],
        [Color(red: 131 / 255, green:  56 / 255, blue: 227 / 255), Color(red: 224 / 255, green: 169 / 255, blue: 187 / 255)],
        [Color(red:  20 / 255, green:  82 / 255, blue: 119 / 255), Color(red: 131 / 255, green: 208 / 255, blue: 203 / 255)],
        [Color(red: 244 / 255, green:   7 / 255, blue:  82 / 255), Color(red: 249 / 255, green: 171 / 255, blue: 143 / 255)],
        [Color(red: 133 / 255, green: 142 / 255, blue: 150 / 255), Color(red:  96 / 255, green: 105 / 255, blue: 107 / 255)],
        [Color(red: 135 / 255, green: 163 / 255, blue: 163 / 255), Color(red: 172 / 255, green: 141 / 255, blue: 154 / 255)],
        [Color(red: 247 / 255, green:  76 / 255, blue:   6 / 255), Color(red: 249 / 255, green: 188 / 255, blue:  44 / 255)],
        [Color(red: 180 / 255, green:  41 / 255, blue: 249 / 255), Color(red:  38 / 255, green: 197 / 255, blue: 243 / 255)],
        [Color(red:  92 / 255, green: 115 / 255, blue: 185 / 255), Color(red: 179 / 255, green:  48 / 255, blue: 225 / 255)],
        [Color(red:   8 / 255, green:  32 / 255, blue:  62 / 255), Color(red:  85 / 255, green: 124 / 255, blue: 147 / 255)],
        [Color(red: 188 / 255, green:  27 / 255, blue: 104 / 255), Color(red: 211 / 255, green: 152 / 255, blue: 155 / 255)],
        [Color(red: 242 / 255, green: 131 / 255, blue: 103 / 255), Color(red: 255 / 255, green:  82 / 255, blue: 130 / 255)],
        [Color(red: 164 / 255, green: 198 / 255, blue: 184 / 255), Color(red:  94 / 255, green:  67 / 255, blue:  93 / 255)],
        [Color(red: 249 / 255, green: 101 / 255, blue:  91 / 255), Color(red: 238 / 255, green: 130 / 255, blue:  26 / 255)],
        [Color(red:  41 / 255, green:  82 / 255, blue: 112 / 255), Color(red:  82 / 255, green:  65 / 255, blue: 117 / 255)],
        [Color(red: 131 / 255, green:  72 / 255, blue: 158 / 255), Color(red: 197 / 255, green:  48 / 255, blue:  46 / 255)],
        [Color(red:  69 / 255, green: 111 / 255, blue: 232 / 255), Color(red:  25 / 255, green: 176 / 255, blue: 236 / 255)],
        [Color(red: 233 / 255, green:  31 / 255, blue: 168 / 255), Color(red: 185 / 255, green: 223 / 255, blue: 238 / 255)],
        [Color(red:  34 / 255, green: 120 / 255, blue: 251 / 255), Color(red: 107 / 255, green: 223 / 255, blue: 219 / 255)],
        [Color(red: 200 / 255, green:  29 / 255, blue: 119 / 255), Color(red: 103 / 255, green:  16 / 255, blue: 194 / 255)],
        [Color(red: 173 / 255, green: 253 / 255, blue: 162 / 255), Color(red:  17 / 255, green: 211 / 255, blue: 243 / 255)],
        [Color(red:  36 / 255, green:  55 / 255, blue:  72 / 255), Color(red:  75 / 255, green: 116 / 255, blue: 159 / 255)],
        [Color(red: 249 / 255, green: 200 / 255, blue:  35 / 255), Color(red: 252 / 255, green:  80 / 255, blue: 110 / 255)],
        [Color(red:  81 / 255, green: 194 / 255, blue: 111 / 255), Color(red: 242 / 255, green: 233 / 255, blue:   1 / 255)],
        [Color(red:  18 / 255, green: 179 / 255, blue: 235 / 255), Color(red:  84 / 255, green:  96 / 255, blue: 249 / 255)],
        [Color(red: 221 / 255, green: 131 / 255, blue: 173 / 255), Color(red: 195 / 255, green: 225 / 255, blue: 252 / 255)],
        [Color(red: 198 / 255, green:  33 / 255, blue: 229 / 255), Color(red: 125 / 255, green: 124 / 255, blue: 249 / 255)],
        [Color(red: 190 / 255, green: 177 / 255, blue:  91 / 255), Color(red: 213 / 255, green: 207 / 255, blue: 172 / 255)],
        [Color(red: 237 / 255, green: 113 / 255, blue: 173 / 255), Color(red: 114 / 255, green: 119 / 255, blue: 241 / 255)],
        [Color(red:  30 / 255, green: 215 / 255, blue: 181 / 255), Color(red: 240 / 255, green: 249 / 255, blue: 167 / 255)],
        [Color(red: 171 / 255, green: 189 / 255, blue: 255 / 255), Color(red: 137 / 255, green:  75 / 255, blue: 119 / 255)],
        [Color(red: 199 / 255, green: 179 / 255, blue: 204 / 255), Color(red:  38 / 255, green: 138 / 255, blue: 178 / 255)],
        [Color(red:  88 / 255, green: 239 / 255, blue: 236 / 255), Color(red: 232 / 255, green:  92 / 255, blue: 144 / 255), Color(red: 252 / 255, green: 201 / 255, blue: 186 / 255)],
        [Color(red: 249 / 255, green: 231 / 255, blue: 187 / 255), Color(red: 233 / 255, green: 124 / 255, blue: 187 / 255), Color(red:  61 / 255, green:  71 / 255, blue: 217 / 255)],
        [Color(red: 216 / 255, green: 189 / 255, blue: 190 / 255), Color(red: 189 / 255, green: 144 / 255, blue: 227 / 255), Color(red: 204 / 255, green:  87 / 255, blue:  95 / 255)],
        [Color(red: 229 / 255, green: 243 / 255, blue: 146 / 255), Color(red: 228 / 255, green: 158 / 255, blue: 113 / 255), Color(red: 212 / 255, green:  95 / 255, blue: 151 / 255)],
        [Color(red: 238 / 255, green: 221 / 255, blue: 243 / 255), Color(red: 238 / 255, green: 146 / 255, blue: 177 / 255), Color(red:  99 / 255, green:  48 / 255, blue: 180 / 255)],
        [Color(red: 212 / 255, green: 234 / 255, blue:  98 / 255), Color(red: 237 / 255, green: 113 / 255, blue:  30 / 255), Color(red: 233 / 255, green:  41 / 255, blue:  92 / 255)],
        [Color(red: 240 / 255, green: 235 / 255, blue: 192 / 255), Color(red: 157 / 255, green: 221 / 255, blue: 244 / 255), Color(red: 233 / 255, green:  58 / 255, blue:  40 / 255)],
        [Color(red: 104 / 255, green: 227 / 255, blue: 249 / 255), Color(red: 245 / 255, green:  90 / 255, blue: 155 / 255), Color(red:  79 / 255, green:  78 / 255, blue: 215 / 255)],
        [Color(red:  69 / 255, green: 160 / 255, blue: 234 / 255), Color(red: 236 / 255, green: 169 / 255, blue: 187 / 255), Color(red: 249 / 255, green: 101 / 255, blue: 142 / 255)],
        [Color(red: 244 / 255, green: 231 / 255, blue: 132 / 255), Color(red: 242 / 255, green:  67 / 255, blue: 137 / 255), Color(red: 164 / 255, green: 120 / 255, blue: 241 / 255)],
        [Color(red: 223 / 255, green: 242 / 255, blue: 203 / 255), Color(red: 240 / 255, green: 161 / 255, blue:  58 / 255), Color(red: 238 / 255, green:  96 / 255, blue: 154 / 255)],
        [Color(red:  93 / 255, green: 224 / 255, blue: 240 / 255), Color(red: 247 / 255, green: 166 / 255, blue: 245 / 255), Color(red: 230 / 255, green:  79 / 255, blue: 111 / 255)],
        [Color(red: 249 / 255, green: 245 / 255, blue: 224 / 255), Color(red: 245 / 255, green: 137 / 255, blue:  92 / 255), Color(red: 179 / 255, green:  78 / 255, blue: 204 / 255)],
        [Color(red: 236 / 255, green: 222 / 255, blue: 196 / 255), Color(red:  98 / 255, green: 244 / 255, blue: 249 / 255), Color(red: 244 / 255, green: 159 / 255, blue: 218 / 255)],
        [Color(red:  94 / 255, green: 222 / 255, blue: 239 / 255), Color(red: 220 / 255, green: 233 / 255, blue:  86 / 255), Color(red: 233 / 255, green: 143 / 255, blue: 192 / 255)],
        [Color(red: 247 / 255, green: 234 / 255, blue:  96 / 255), Color(red:  60 / 255, green: 242 / 255, blue: 222 / 255), Color(red: 247 / 255, green: 116 / 255, blue: 187 / 255)],
        [Color(red: 164 / 255, green: 233 / 255, blue: 249 / 255), Color(red: 197 / 255, green: 174 / 255, blue: 242 / 255), Color(red: 133 / 255, green: 120 / 255, blue: 234 / 255)],
        [Color(red: 255 / 255, green: 241 / 255, blue: 191 / 255), Color(red: 236 / 255, green:  69 / 255, blue: 141 / 255), Color(red:  71 / 255, green:  78 / 255, blue: 215 / 255)],
        [Color(red: 252 / 255, green: 243 / 255, blue: 196 / 255), Color(red: 249 / 255, green:  98 / 255, blue: 160 / 255), Color(red: 170 / 255, green: 150 / 255, blue: 249 / 255)],
        [Color(red: 252 / 255, green: 239 / 255, blue: 100 / 255), Color(red: 252 / 255, green: 196 / 255, blue:  75 / 255), Color(red: 244 / 255, green:  76 / 255, blue: 125 / 255)],
        [Color(red:  79 / 255, green: 230 / 255, blue: 241 / 255), Color(red: 166 / 255, green: 166 / 255, blue: 222 / 255), Color(red: 237 / 255, green: 144 / 255, blue: 207 / 255)],
        [Color(red:  83 / 255, green: 219 / 255, blue: 242 / 255), Color(red: 206 / 255, green: 158 / 255, blue: 236 / 255), Color(red:  58 / 255, green: 127 / 255, blue: 242 / 255)],
        [Color(red: 211 / 255, green: 238 / 255, blue: 244 / 255), Color(red: 241 / 255, green: 238 / 255, blue: 200 / 255), Color(red: 243 / 255, green: 164 / 255, blue: 108 / 255)],
        [Color(red: 240 / 255, green: 234 / 255, blue: 252 / 255), Color(red:  97 / 255, green: 206 / 255, blue: 242 / 255), Color(red: 245 / 255, green:  56 / 255, blue: 185 / 255)],
        [Color(red: 248 / 255, green: 249 / 255, blue: 199 / 255), Color(red: 242 / 255, green: 193 / 255, blue: 234 / 255), Color(red: 246 / 255, green: 123 / 255, blue: 107 / 255)],
        [Color(red: 174 / 255, green: 209 / 255, blue: 239 / 255), Color(red: 242 / 255, green: 223 / 255, blue: 193 / 255), Color(red: 240 / 255, green: 185 / 255, blue: 239 / 255)],
        [Color(red: 242 / 255, green: 243 / 255, blue: 226 / 255), Color(red: 178 / 255, green: 229 / 255, blue: 248 / 255), Color(red: 244 / 255, green: 179 / 255, blue: 239 / 255)],
        [Color(red: 252 / 255, green: 212 / 255, blue: 202 / 255), Color(red: 244 / 255, green: 142 / 255, blue: 195 / 255), Color(red: 252 / 255, green: 148 / 255, blue: 179 / 255)],
        [Color(red: 202 / 255, green: 207 / 255, blue: 249 / 255), Color(red: 245 / 255, green: 203 / 255, blue: 217 / 255), Color(red: 244 / 255, green: 188 / 255, blue: 205 / 255)],
        [Color(red: 252 / 255, green: 244 / 255, blue: 223 / 255), Color(red: 239 / 255, green: 183 / 255, blue: 234 / 255), Color(red: 214 / 255, green: 111 / 255, blue: 238 / 255)],
        [Color(red: 202 / 255, green: 242 / 255, blue: 239 / 255), Color(red: 201 / 255, green: 239 / 255, blue: 220 / 255), Color(red: 242 / 255, green: 187 / 255, blue: 241 / 255)],
        [Color(red: 215 / 255, green: 235 / 255, blue: 235 / 255), Color(red: 244 / 255, green: 175 / 255, blue: 233 / 255), Color(red: 157 / 255, green: 126 / 255, blue: 243 / 255)],
        [Color(red: 247 / 255, green: 233 / 255, blue: 232 / 255), Color(red: 233 / 255, green: 240 / 255, blue: 170 / 255), Color(red: 153 / 255, green: 172 / 255, blue: 235 / 255)],
        [Color(red: 248 / 255, green: 218 / 255, blue: 220 / 255), Color(red: 182 / 255, green: 237 / 255, blue: 200 / 255), Color(red: 238 / 255, green: 172 / 255, blue: 220 / 255)],
        [Color(red: 244 / 255, green: 230 / 255, blue: 241 / 255), Color(red: 243 / 255, green: 160 / 255, blue: 215 / 255), Color(red: 179 / 255, green: 232 / 255, blue: 247 / 255)],
        [Color(red: 252 / 255, green: 219 / 255, blue: 202 / 255), Color(red: 230 / 255, green: 165 / 255, blue: 204 / 255), Color(red: 213 / 255, green: 179 / 255, blue: 232 / 255)],
        [Color(red: 220 / 255, green: 241 / 255, blue: 128 / 255), Color(red: 240 / 255, green: 205 / 255, blue: 151 / 255), Color(red:  53 / 255, green:  81 / 255, blue: 138 / 255)],
        [Color(red: 184 / 255, green: 233 / 255, blue: 212 / 255), Color(red: 244 / 255, green: 152 / 255, blue:  90 / 255), Color(red:  18 / 255, green:  36 / 255, blue:  63 / 255)],
        [Color(red:  35 / 255, green: 158 / 255, blue: 171 / 255), Color(red: 116 / 255, green: 222 / 255, blue: 238 / 255)],
        [Color(red:  14 / 255, green:  28 / 255, blue:  38 / 255), Color(red:  42 / 255, green:  69 / 255, blue:  75 / 255), Color(red:  41 / 255, green:  72 / 255, blue:  97 / 255)],
        [Color(red:  28 / 255, green: 220 / 255, blue: 232 / 255), Color(red: 187 / 255, green: 119 / 255, blue: 237 / 255), Color(red: 243 / 255, green:  74 / 255, blue:  98 / 255)],
        [Color(red: 189 / 255, green:  71 / 255, blue:  51 / 255), Color(red:  25 / 255, green:  93 / 255, blue: 186 / 255)],
        [Color(red:  44 / 255, green: 108 / 255, blue: 188 / 255), Color(red: 113 / 255, green: 195 / 255, blue: 247 / 255), Color(red: 246 / 255, green: 246 / 255, blue: 246 / 255)],
        [Color(red: 244 / 255, green:  17 / 255, blue: 158 / 255), Color(red:  74 / 255, green:  49 / 255, blue:  62 / 255)],
        [Color(red: 160 / 255, green:  73 / 255, blue: 112 / 255), Color(red: 109 / 255, green: 108 / 255, blue: 131 / 255), Color(red:  59 / 255, green: 127 / 255, blue: 153 / 255)],
        [Color(red:  28 / 255, green:  62 / 255, blue:  53 / 255), Color(red: 153 / 255, green: 242 / 255, blue: 209 / 255)],
        [Color(red: 193 / 255, green:  30 / 255, blue:  56 / 255), Color(red:  34 / 255, green:  11 / 255, blue:  52 / 255)],
        [Color(red: 230 / 255, green:  35 / 255, blue:  20 / 255), Color(red: 241 / 255, green: 158 / 255, blue:  24 / 255)],
        [Color(red:  99 / 255, green: 139 / 255, blue: 149 / 255), Color(red: 244 / 255, green: 113 / 255, blue:  31 / 255)],
        [Color(red: 218 / 255, green:  59 / 255, blue:  58 / 255), Color(red: 101 / 255, green: 221 / 255, blue: 145 / 255)],
        [Color(red:  84 / 255, green:  79 / 255, blue: 125 / 255), Color(red: 255 / 255, green: 203 / 255, blue:  80 / 255)],
        [Color(red:  10 / 255, green: 182 / 255, blue: 248 / 255), Color(red: 237 / 255, green:  45 / 255, blue:  83 / 255)],
        [Color(red: 109 / 255, green:  81 / 255, blue: 165 / 255), Color(red: 228 / 255, green: 167 / 255, blue: 197 / 255)],
        [Color(red: 248 / 255, green:  61 / 255, blue:  92 / 255), Color(red: 253 / 255, green:  75 / 255, blue:  47 / 255)],
        [Color(red: 131 / 255, green:  35 / 255, blue: 136 / 255), Color(red: 227 / 255, green:  67 / 255, blue: 107 / 255), Color(red: 240 / 255, green: 119 / 255, blue:  47 / 255)],
        [Color(red:  42 / 255, green: 141 / 255, blue:   8 / 255), Color(red: 242 / 255, green: 231 / 255, blue:  19 / 255), Color(red: 247 / 255, green:  30 / 255, blue:   6 / 255)],
        [Color(red: 224 / 255, green:  31 / 255, blue:  45 / 255), Color(red: 148 / 255, green:  60 / 255, blue:  34 / 255)],
        [Color(red: 244 / 255, green: 217 / 255, blue:  65 / 255), Color(red: 236 / 255, green: 130 / 255, blue:  53 / 255)],
        [Color(red:  88 / 255, green: 181 / 255, blue: 128 / 255), Color(red: 166 / 255, green: 123 / 255, blue: 224 / 255), Color(red: 102 / 255, green:  36 / 255, blue: 192 / 255)],
        [Color(red: 207 / 255, green:  65 / 255, blue:  75 / 255), Color(red: 133 / 255, green:  33 / 255, blue: 112 / 255)],
        [Color(red:  94 / 255, green:  94 / 255, blue:  94 / 255), Color(red: 164 / 255, green: 163 / 255, blue:  88 / 255)],
        [Color(red: 177 / 255, green:  91 / 255, blue: 134 / 255), Color(red:  68 / 255, green:  15 / 255, blue:  80 / 255)],
        [Color(red: 185 / 255, green:  76 / 255, blue: 152 / 255), Color(red: 240 / 255, green:   7 / 255, blue:  59 / 255)],
        [Color(red:  59 / 255, green: 207 / 255, blue: 212 / 255), Color(red: 252 / 255, green: 147 / 255, blue:   5 / 255), Color(red: 242 / 255, green:   0 / 255, blue: 148 / 255)],
        [Color(red:  28 / 255, green: 144 / 255, blue: 191 / 255), Color(red: 235 / 255, green: 138 / 255, blue:  61 / 255)],
        [Color(red: 239 / 255, green:  86 / 255, blue: 106 / 255), Color(red:  98 / 255, green: 122 / 255, blue: 247 / 255)],
        [Color(red: 252 / 255, green:  71 / 255, blue: 120 / 255), Color(red:  57 / 255, green:  82 / 255, blue: 245 / 255)],
        [Color(red:  43 / 255, green:   9 / 255, blue:  72 / 255), Color(red: 206 / 255, green: 101 / 255, blue:  59 / 255)],
        [Color(red: 253 / 255, green: 241 / 255, blue: 203 / 255), Color(red: 176 / 255, green:  16 / 255, blue:  65 / 255)],
        [Color(red:  63 / 255, green:  63 / 255, blue:  66 / 255), Color(red:  93 / 255, green:  93 / 255, blue:  60 / 255)],
        [Color(red: 189 / 255, green: 167 / 255, blue:  52 / 255), Color(red: 247 / 255, green: 242 / 255, blue: 171 / 255)],
        [Color(red: 129 / 255, green:   5 / 255, blue: 118 / 255), Color(red: 252 / 255, green: 193 / 255, blue: 207 / 255)],
        [Color(red:   0 / 255, green: 238 / 255, blue: 110 / 255), Color(red:  12 / 255, green: 117 / 255, blue: 230 / 255)],
        [Color(red: 246 / 255, green:  76 / 255, blue:  24 / 255), Color(red: 238 / 255, green: 149 / 255, blue:  57 / 255)],
        [Color(red: 107 / 255, green: 100 / 255, blue:  36 / 255), Color(red: 211 / 255, green: 206 / 255, blue: 186 / 255)],
        [Color(red:  14 / 255, green:   7 / 255, blue:  37 / 255), Color(red:  92 / 255, green:   3 / 255, blue: 188 / 255), Color(red: 229 / 255, green:  54 / 255, blue: 171 / 255), Color(red: 244 / 255, green: 229 / 255, blue: 240 / 255)],
        [Color(red:  26 / 255, green:  39 / 255, blue: 102 / 255), Color(red: 174 / 255, green:  27 / 255, blue:  30 / 255), Color(red: 252 / 255, green: 159 / 255, blue:  50 / 255)],
        [Color(red:  44 / 255, green: 178 / 255, blue: 186 / 255), Color(red: 251 / 255, green: 185 / 255, blue:  45 / 255)],
        [Color(red: 247 / 255, green: 135 / 255, blue: 112 / 255), Color(red: 255 / 255, green:  96 / 255, blue: 123 / 255)],
        [Color(red: 161 / 255, green:   6 / 255, blue: 244 / 255), Color(red: 231 / 255, green:   7 / 255, blue: 250 / 255)],
        [Color(red: 202 / 255, green: 208 / 255, blue: 255 / 255), Color(red: 227 / 255, green: 227 / 255, blue: 227 / 255)],
        [Color(red: 102 / 255, green:  49 / 255, blue: 119 / 255), Color(red: 198 / 255, green:  63 / 255, blue: 123 / 255)],
        [Color(red:  12 / 255, green:  12 / 255, blue:  12 / 255), Color(red:  15 / 255, green: 151 / 255, blue:  28 / 255)],
        [Color(red: 203 / 255, green:  66 / 255, blue: 136 / 255), Color(red: 182 / 255, green:  53 / 255, blue:  59 / 255)],
        [Color(red:  62 / 255, green:  25 / 255, blue: 110 / 255), Color(red: 212 / 255, green: 108 / 255, blue: 118 / 255), Color(red: 255 / 255, green: 192 / 255, blue: 124 / 255)],
        [Color(red:  43 / 255, green:  69 / 255, blue: 132 / 255), Color(red:  74 / 255, green: 158 / 255, blue:  72 / 255)],
        [Color(red: 186 / 255, green:  52 / 255, blue:  41 / 255), Color(red: 146 / 255, green:  67 / 255, blue: 169 / 255)],
        [Color(red:   2 / 255, green:   3 / 255, blue:  68 / 255), Color(red:  40 / 255, green: 184 / 255, blue: 213 / 255)],
        [Color(red: 230 / 255, green:  87 / 255, blue:  99 / 255), Color(red:   8 / 255, green:   8 / 255, blue:   8 / 255)],
        [Color(red:  34 / 255, green:   5 / 255, blue:  45 / 255), Color(red: 204 / 255, green: 179 / 255, blue: 209 / 255)],
        [Color(red:  74 / 255, green: 155 / 255, blue: 127 / 255), Color(red:  10 / 255, green:  52 / 255, blue:  49 / 255)],
        [Color(red:  31 / 255, green:   0 / 255, blue:  33 / 255), Color(red: 117 / 255, green:  16 / 255, blue:   6 / 255)],
        [Color(red:   9 / 255, green: 104 / 255, blue: 229 / 255), Color(red:   9 / 255, green:  25 / 255, blue: 112 / 255)],
        [Color(red:  67 / 255, green: 193 / 255, blue: 151 / 255), Color(red:  28 / 255, green:  21 / 255, blue:  84 / 255)],
        [Color(red:  11 / 255, green:  44 / 255, blue:  36 / 255), Color(red:  36 / 255, green: 122 / 255, blue:  77 / 255)],
        [Color(red: 228 / 255, green: 231 / 255, blue: 228 / 255), Color(red:  10 / 255, green:  22 / 255, blue:  71 / 255)],
        [Color(red:  60 / 255, green: 140 / 255, blue: 222 / 255), Color(red: 237 / 255, green: 115 / 255, blue: 168 / 255)],
        [Color(red: 226 / 255, green:  11 / 255, blue: 140 / 255), Color(red: 248 / 255, green:  75 / 255, blue:   0 / 255)],
        [Color(red: 242 / 255, green: 194 / 255, blue: 238 / 255), Color(red: 231 / 255, green:  99 / 255, blue: 249 / 255)],
        [Color(red:   5 / 255, green: 201 / 255, blue: 249 / 255), Color(red: 229 / 255, green: 246 / 255, blue:  27 / 255)],
        [Color(red: 249 / 255, green: 125 / 255, blue:  91 / 255), Color(red: 249 / 255, green: 168 / 255, blue: 123 / 255)],
        [Color(red:  67 / 255, green: 108 / 255, blue: 137 / 255), Color(red: 139 / 255, green:  44 / 255, blue:  64 / 255)],
        [Color(red:  93 / 255, green: 169 / 255, blue:  47 / 255), Color(red: 155 / 255, green: 212 / 255, blue: 106 / 255)],
        [Color(red:   0 / 255, green:   3 / 255, blue:  40 / 255), Color(red:   0 / 255, green:  69 / 255, blue: 142 / 255)],
        [Color(red:  73 / 255, green:  41 / 255, blue:  87 / 255), Color(red: 116 / 255, green:  74 / 255, blue: 109 / 255)],
        [Color(red:   1 / 255, green: 219 / 255, blue: 255 / 255), Color(red: 145 / 255, green: 141 / 255, blue: 172 / 255)],
        [Color(red: 245 / 255, green:  92 / 255, blue: 122 / 255), Color(red: 246 / 255, green: 188 / 255, blue: 102 / 255)],
        [Color(red: 252 / 255, green: 239 / 255, blue:   4 / 255), Color(red: 220 / 255, green:  65 / 255, blue: 155 / 255)],
        [Color(red:  90 / 255, green:  68 / 255, blue:  58 / 255), Color(red:  46 / 255, green: 112 / 255, blue:  59 / 255)],
        [Color(red:  65 / 255, green:  19 / 255, blue: 174 / 255), Color(red: 214 / 255, green: 186 / 255, blue:  85 / 255)],
        [Color(red:  46 / 255, green: 112 / 255, blue:  55 / 255), Color(red: 166 / 255, green:  63 / 255, blue:  78 / 255)],
        [Color(red: 173 / 255, green:  70 / 255, blue: 137 / 255), Color(red: 237 / 255, green:  92 / 255, blue: 134 / 255)],
        [Color(red: 140 / 255, green:  17 / 255, blue:   5 / 255), Color(red:  37 / 255, green:  34 / 255, blue:  30 / 255)],
        [Color(red: 183 / 255, green: 156 / 255, blue:   5 / 255), Color(red:  22 / 255, green:  22 / 255, blue:  22 / 255)],
        [Color(red:  10 / 255, green:  51 / 255, blue: 249 / 255), Color(red: 246 / 255, green: 241 / 255, blue:  81 / 255)],
        [Color(red: 104 / 255, green: 141 / 255, blue:  21 / 255), Color(red:  20 / 255, green:  21 / 255, blue:  22 / 255)],
        [Color(red: 131 / 255, green: 153 / 255, blue: 162 / 255), Color(red: 238 / 255, green: 242 / 255, blue: 243 / 255)],
        [Color(red:  30 / 255, green: 108 / 255, blue: 142 / 255), Color(red:  46 / 255, green: 119 / 255, blue: 117 / 255)],
        [Color(red: 249 / 255, green:  12 / 255, blue: 113 / 255), Color(red:  48 / 255, green:   0 / 255, blue:  26 / 255)],
        [Color(red:  31 / 255, green:  20 / 255, blue:  13 / 255), Color(red: 155 / 255, green: 128 / 255, blue: 116 / 255)],
        [Color(red: 212 / 255, green: 120 / 255, blue:  26 / 255), Color(red: 170 / 255, green:  54 / 255, blue: 120 / 255)],
        [Color(red:  70 / 255, green: 184 / 255, blue:  61 / 255), Color(red:  17 / 255, green:  30 / 255, blue:  11 / 255)],
        [Color(red:  90 / 255, green: 103 / 255, blue: 118 / 255), Color(red: 255 / 255, green: 123 / 255, blue: 116 / 255)],
        [Color(red: 118 / 255, green:   3 / 255, blue:  15 / 255), Color(red:  18 / 255, green:  27 / 255, blue: 103 / 255)],
        [Color(red: 175 / 255, green: 252 / 255, blue: 175 / 255), Color(red:  18 / 255, green: 223 / 255, blue: 243 / 255)],
        [Color(red:   1 / 255, green:   1 / 255, blue:   1 / 255), Color(red: 233 / 255, green:  93 / 255, blue:  60 / 255)],
        [Color(red: 195 / 255, green: 198 / 255, blue:   0 / 255), Color(red: 133 / 255, green: 140 / 255, blue:  11 / 255)],
        [Color(red: 127 / 255, green:   0 / 255, blue:  18 / 255), Color(red:  27 / 255, green:  10 / 255, blue:   7 / 255)],
        [Color(red:  33 / 255, green:  86 / 255, blue:   0 / 255), Color(red: 217 / 255, green: 218 / 255, blue: 206 / 255)],
        [Color(red: 102 / 255, green:  88 / 255, blue:   3 / 255), Color(red: 158 / 255, green: 155 / 255, blue: 107 / 255)],
        [Color(red: 247 / 255, green:  86 / 255, blue: 170 / 255), Color(red: 247 / 255, green:  86 / 255, blue: 114 / 255)],
        [Color(red:  67 / 255, green:  71 / 255, blue:  11 / 255), Color(red: 118 / 255, green: 126 / 255, blue:  32 / 255)],
        [Color(red: 207 / 255, green:  32 / 255, blue:  62 / 255), Color(red:  80 / 255, green:  93 / 255, blue: 160 / 255)],
        [Color(red: 114 / 255, green: 122 / 255, blue: 154 / 255), Color(red: 216 / 255, green: 219 / 255, blue: 233 / 255)],
        [Color(red:  33 / 255, green:  31 / 255, blue:  47 / 255), Color(red: 145 / 255, green: 140 / 255, blue: 169 / 255)],
        [Color(red: 232 / 255, green: 157 / 255, blue:  31 / 255), Color(red: 228 / 255, green: 233 / 255, blue:  93 / 255)],
        [Color(red:  52 / 255, green: 135 / 255, blue:  86 / 255), Color(red:  84 / 255, green: 182 / 255, blue: 202 / 255)],
        [Color(red:  94 / 255, green:  55 / 255, blue:  25 / 255), Color(red: 178 / 255, green: 164 / 255, blue: 150 / 255)],
        [Color(red: 184 / 255, green: 156 / 255, blue: 147 / 255), Color(red: 142 / 255, green: 104 / 255, blue: 101 / 255)],
        [Color(red: 255 / 255, green: 206 / 255, blue:   6 / 255), Color(red: 108 / 255, green: 150 / 255, blue:  13 / 255)],
        [Color(red: 128 / 255, green: 155 / 255, blue:  14 / 255), Color(red: 174 / 255, green: 183 / 255, blue: 120 / 255)],
        [Color(red:   7 / 255, green:  65 / 255, blue: 112 / 255), Color(red: 126 / 255, green: 144 / 255, blue:  18 / 255), Color(red: 255 / 255, green: 247 / 255, blue:   8 / 255)],
        [Color(red: 250 / 255, green: 250 / 255, blue:   0 / 255), Color(red: 112 / 255, green: 150 / 255, blue:  12 / 255)],
    ]
}
