class BotController < ApplicationController
    def index
        @chats = ChatLog.all
    end
    
    def edit
        @Bots = Bot.all
    end
    
    def modify
        @bot = Bot.find(params[:id])
    end
    
    def update
        pp = Bot.find(params[:id])
        pp.question = params[:question]
        pp.answer = params[:answer]
        pp.save
        redirect_to  '/bot/edit'
    end
    
    def create
        Bot.create(question: params[:question], answer: params[:answer])
        redirect_to '/bot/edit'
    end
    
    def destroy
        pp = Bot.find(params[:id])
        pp.destroy
        redirect_to '/bot/edit'
    end
    
    def chat
        @chat=Bot.where(question: params[:chat_input]).sample
        if @chat.nil?
            redirect_to '/bot/edit'
            # 배우기페이지로
        else
        ChatLog.create(person: @chat.question, bot: @chat.answer)
            # 채팅로그에 남기고 루트로
        redirect_to :root
        end
    end
end