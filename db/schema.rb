# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170623143617) do

  create_table "alternativas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "alternativa"
    t.boolean "qualidade", default: false
    t.bigint "questao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questao_id"], name: "index_alternativas_on_questao_id"
  end

  create_table "carreiras", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nome"
    t.bigint "curso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curso_id"], name: "index_carreiras_on_curso_id"
  end

  create_table "categorias", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "categoria"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categorias_questoes", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "categoria_id"
    t.integer "questao_id"
  end

  create_table "cursos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nome"
    t.text "descricao"
    t.string "duracao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "modulos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nome"
    t.bigint "curso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curso_id"], name: "index_modulos_on_curso_id"
  end

  create_table "noticias", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "titulo"
    t.text "texto"
    t.string "uf"
    t.string "vaga"
    t.string "salario"
    t.string "banca"
    t.string "edital"
    t.string "inscricao"
    t.string "cargo"
    t.string "resume"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nome"
    t.string "formacao"
    t.text "curriculo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questionarios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "titulo"
    t.text "feedback"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questoes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "questao"
    t.integer "valor"
    t.text "feedback"
    t.integer "penalidade"
    t.bigint "questionario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questionario_id"], name: "index_questoes_on_questionario_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nome"
    t.string "email"
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "alternativas", "questoes"
  add_foreign_key "carreiras", "cursos"
  add_foreign_key "modulos", "cursos"
  add_foreign_key "questoes", "questionarios"
end
