print("__________________________________________________________________________________________________________________________ encoding ")
# -*- coding: utf-8 -*-
print("__________________________________________________________________________________________________________________________ modules ")
# from random import randint, random
# import pyttsx3
from bs4 import BeautifulSoup as bs
# from config import config_web, config_db, db_url, url_paths, url_error_pages
from datetime import datetime
from gtts import gTTS
from mutagen.mp3 import MP3
from selenium import webdriver
# from sqlalchemy.dialects.mysql import mariadb
# from sqlalchemy.orm import declarative_base, sessionmaker
from urllib.parse import unquote
import inspect
import json
import os
import psutil  # 실행중인 프로세스 및 시스템 활용 라이브러리
import random
import requests
# import sqlalchemy
import subprocess
import sys
import time
import traceback
import win32api

print("__________________________________________________________________________________________________________________________ constant")
AI_available_cmd_code_list = [
    # '0:fake AI 가용명령목록 조회',
    # '`:single mode',
    # '``:batch mode',
    '`:advanced batch mode',
    'jhppc1:jhppc1',
    'remotedesktop:remote desktop',
    # 'voice mode:voice mode',
    # 'voiceless mode:voiceless mode',
    '시간:시간',
    '미세먼지랭킹:',
    '종합날씨:',
    '미세먼지:[없네..]',
    '초미세먼지:',
    '공간:공간',
    '체감온도:체감온도',
    '가용명령개수:가용명령개수',
    '종합날씨정보:종합날씨정보',
    '식물조언:식물조언',
    '스케쥴 모드:스케쥴 모드',
    'cls():cls()',
    'taskkill(알송):_________',
    '_________:_________',
    '172.30.1.33:_________',
    'sd_s:shutdown',
    'sd_e:shutdown cancelation',
    'x:exit'
]
high_frequency_batch_cmd_routine_pattern_list = [
    # '',
    'ex) 111111:[미세먼지정보]',
    # '',
    ''
]
nbsp = ' '
print("__________________________________________________________________________________________________________________________ function")


def cls():
    os.system('cls')


def all_info():
    print("__________________________________________________________________________________________________________________________ 현재 pc에 연결된 드라이브 출력 s")
    drives = win32api.GetLogicalDriveStrings()
    drives = drives.split('\000')[:-1]
    print(drives)
    print("__________________________________________________________________________________________________________________________ 현재 pc에 연결된 드라이브 출력 e")
    print("__________________________________________________________________________________________________________________________ 현재 디렉토리 위치 s")
    print(os.getcwd())
    print("__________________________________________________________________________________________________________________________ 현재 디렉토리 위치 e")
    print("__________________________________________________________________________________________________________________________ 현재 디렉토리 파일의 Modified/Created/Accessed 일자 s")
    current_files = subprocess.check_output('dir /b /s /o /a-d', shell=True).decode('utf-8')  # 파일만
    lines = current_files.split("\n")
    for line in lines:
        try:
            print("Modified : " + time.ctime(os.path.getmtime(line)))
            print("Created : " + time.ctime(os.path.getctime(line)))
            print("Accessed : " + time.ctime(os.path.getatime(line)))
        except:
            pass
    print("__________________________________________________________________________________________________________________________ 현재 디렉토리 파일의 일자 s")
    print("__________________________________________________________________________________________________________________________ 생성된지 7일 된 모든 확장자 파일 출력 s")
    os.system('forfiles /P "E:\PRJS_PRIVATE\prj_memo\private.bkup" /S /M *.* /D -7 /C "cmd /c @echo @path" ')
    print("__________________________________________________________________________________________________________________________ 생성된지 7일 된 모든 확장자 파일 출력 e")
    # print("__________________________________________________________________________________________________________________________ 생성된지 1일 된 zip 확장자의 백업 파일 삭제 s")
    # os.system('forfiles /P "E:\PRJS_PRIVATE\prj_memo\private.bkup" /S /M *.zip /D -1 /C "cmd /c del @file" ')  # 2003 년 이후 설치 된 PC !주의! forfiles의 옵션이 달라서 큰 사이드 이펙트 일으킬 수 있음.
    # print("__________________________________________________________________________________________________________________________ 생성된지 1일 된 zip 확장자의 백업 파일 삭제 e")
    print("__________________________________________________________________________________________________________________________ cmd.exe 실행 결과 한번에 출력 s")
    tmp = subprocess.check_output('dir /b /s /o /ad', shell=True).decode('utf-8')  # 폴더만
    tmp = subprocess.check_output('dir /b /s /o /a-d', shell=True).decode('utf-8')  # 파일만
    tmp = subprocess.check_output('dir /b /s /o /a', shell=True).decode('utf-8')  # 전부
    print(tmp)
    print("__________________________________________________________________________________________________________________________ cmd.exe 실행 결과 한번에 출력 e")
    print("__________________________________________________________________________________________________________________________ 현재 디렉토리 파일만 사이즈 출력 s")
    # current_files = os.popen('dir /b /s /o /a').readlines()    # 전부
    # current_files = os.popen('dir /b /s /o /ad').readlines()   # 폴더만
    current_files = subprocess.check_output('dir /b /s /o /a-d', shell=True).decode('utf-8')  # 파일만
    lines = current_files.split("\n")
    for line in lines:
        try:
            tmp = round(os.path.getsize(line.strip()) / (1024.0 * 1024.0), 2)
            if (tmp < 1):
                print(line.strip() + " : " + str(round(os.path.getsize(line.strip()) / (1024.0), 2)) + ' KB')
            elif (tmp < 1024):
                print(line.strip() + " : " + str(round(os.path.getsize(line.strip()) / (1024.0 * 1024.0), 2)) + ' MB')
            else:
                print(line.strip() + " : " + str(
                    round(os.path.getsize(line.strip()) / (1024.0 * 1024.0 * 1024.0), 2)) + ' GB')
        except:
            pass
    print("__________________________________________________________________________________________________________________________ 현재 디렉토리 파일만 사이즈 출력 e")
    print("__________________________________________________________________________________________________________________________ 현재 디렉토리 파일만 사이즈 출력2 s")
    def convert_size(size_by_tes):
        import math
        if size_by_tes == 0:
            return "0B"
        size_name = ("B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB")
        i = int(math.floor(math.log(size_by_tes, 1024)))
        p = math.pow(1024, i)
        s = round(size_by_tes / p, 2)
        return "%s %s" % (s, size_name[i])

    current_files = subprocess.check_output('dir /b /s /o /a-d', shell=True).decode('utf-8')  # 파일만
    lines = current_files.split("\n")
    for line in lines:
        try:
            print(line.strip() + "{{delimeter}}" + str(convert_size(os.path.getsize(line.strip()))))
        except:
            pass
    print("__________________________________________________________________________________________________________________________ 현재 디렉토리 파일만 사이즈 출력2 e")
    print("__________________________________________________________________________________________________________________________ 현재 디렉토리 파일만 생성일자 출력 s")
    current_files = subprocess.check_output('dir /b /s /o /a-d', shell=True).decode('utf-8')  # 파일만
    lines = current_files.split("\n")
    for line in lines:
        try:
            # print(os.path.getmtime(line.strip()))
            # print(time.ctime(os.path.getmtime(line.strip())))
            # print(line.strip() + "{{delimeter}}" + str(os.path.getctime(line.strip())))
            # print(line.strip() + "{{delimeter}}" + str(datetime.datetime.fromtimestamp(os.path.getctime(line.strip())).strftime('%Y-%m-%d %H:%M:%S')))
            print(line.strip() + "{{delimeter}}" + str(time.ctime(os.path.getmtime(line.strip()))))
        except:
            pass
    print("__________________________________________________________________________________________________________________________ 현재 디렉토리 파일만 생성일자 출력 e")
    print("__________________________________________________________________________________________________________________________ 20230414 18:00 이후 생성된 파일 출력 s")
    inputDate = datetime.strptime(str(input('Searching Input Date : ')), '%Y%m%d %H:%M')
    opening_directory = r'D:\test'
    for (path, dir, files) in os.walk(opening_directory):
        for filename in files:
            fileMtime = datetime.fromtimestamp(os.path.getmtime(path + '\\' + filename))
            if inputDate < fileMtime:
                print('경로 : [%s], 파일명 : [%s], 수정일자 : [%s]' % (path, filename, fileMtime))
    print("__________________________________________________________________________________________________________________________ 20180526 14:00 이후 생성된 파일 출력 e")
    print("__________________________________________________________________________________________________________________________ 20230414 18:00 이전 생성된 파일 출력 s")
    inputDate = datetime.strptime(str(input('Searching Input Date : ')), '%Y%m%d %H:%M')
    opening_directory = r'D:\test'
    for (path, dir, files) in os.walk(opening_directory):
        for filename in files:
            fileMtime = datetime.fromtimestamp(os.path.getmtime(path + '\\' + filename))
            if inputDate > fileMtime:
                print('경로 : [%s], 파일명 : [%s], 수정일자 : [%s]' % (path, filename, fileMtime))
                print('[%s\%s]' % (path, filename))
    print("__________________________________________________________________________________________________________________________ 20180526 14:00 이전 생성된 파일 출력 e")
    print("__________________________________________________________________________________________________________________________ 현재시간기준 생성된지 1일 된 zip 확장자 파일만 출력 s")
    times = to_time_style("0").split(' ')
    time_inputed = times[0] + times[1] + str(int(times[2]) - 1) + " " + times[3] + ":" + times[4]
    print(time_inputed)
    time_inputed = '20230414 20:53'
    print(time_inputed)
    inputDate = datetime.strptime(str(time_inputed), '%Y%m%d %H:%M')
    opening_directory = opening_directory
    for (path, dir, files) in os.walk(opening_directory):
        for filename in files:
            fileMtime = datetime.fromtimestamp(os.path.getmtime(path + '\\' + filename))
            if inputDate < fileMtime:
                print('[%s\%s    modified : %s]' % (path, filename, fileMtime))
                print('[%s\%s]' % (path, filename))
                print('[%s]' % (filename))
    pause()
    print("__________________________________________________________________________________________________________________________ 현재시간기준 생성된지 1일 된 zip 확장자 파일만 출력 e")
    print("__________________________________________________________________________________________________________________________ __________.xls s")
    print("__________________________________________________________________________________________________________________________ __________.xls e")
    print("__________________________________________________________________________________________________________________________ __________.json writing s")
    import json
    data_as_dict = {
        'ID_REQUEST': 1,
        'CUSTOMER_NAME': '_박_정_훈_',
        'MASSAGE_REQUESTED': '주문서변경요청',
        'DATE_REQUESTED': to_time_style("1"),
        'USE_YN': "Y",
    }
    data_as_str = json.dumps(data_as_dict, indent=4)
    print(data_as_str)



    data_as_dict = {}
    data_as_dict['head'] = []
    data_as_dict['head'].append({
        "title": "Android Q, Scoped Storage",
        "url": "https://codechacha.com/ko/android-q-scoped-storage/",
        "draft": "false"
    })
    data_as_dict['body'] = []
    data_as_dict['body'].append({
    })
    data_as_dict['config'] = []
    data_as_dict['config'].append({
        "host": config_web['host'],
        "port": config_web['port'],
    })
    print(data_as_dict)
    print(type(data_as_dict))
    json_file_path = "./json/__________.json"
    with open(json_file_path, 'w') as outfile:
        json.dump(data_as_dict, outfile, indent=4)
    print("__________________________________________________________________________________________________________________________ __________.json writing e")
    print("__________________________________________________________________________________________________________________________ __________.json JSON Encoding s")
    data_as_dict = {
        'ID_REQUEST': 1,
        'CUSTOMER_NAME': '_박_정_훈_',
        'MASSAGE_REQUESTED': '주문서변경요청',
        'DATE_REQUESTED': to_time_style("1"),
        'USE_YN': "Y",
        'MARVEL CHARACTERS': [
            {'MACHANICAL MEMBER1': ['IRONMAN', 'BLACK PANTHER']},
            {'MITHICAL MEMBER1': ['ROKI', 'THOR PANTHER']},
        ]
    }
    print(data_as_dict)
    print(type(data_as_dict))
    json_file_path = "./json/__________.json"
    with open(json_file_path, 'w') as outfile:
        json.dump(data_as_dict, outfile, indent=4)
    print("__________________________________________________________________________________________________________________________ __________.json JSON Encoding e")
    print("__________________________________________________________________________________________________________________________ __________.json JSON Decoding s")
    # json 파일을 가져와서 python data type[Dictionary, List, Tuple , str] 으로 변환하는 작업
    data_as_str = '{"name": "강ㅇ수", "id": 152352, "history": [{"date": "2015-03-11", "item": "iPhone"}, {"date": "2016-02-23", "item": "Monitor"}]}'
    data_as_dict = json.loads(data_as_str)

    print(json.dumps(data_as_dict, indent=4, sort_keys=True))
    print(data_as_dict['name'])
    print(data_as_dict['id'])
    for depth_level1 in data_as_dict['history']:
        print(depth_level1['date'], depth_level1['item'])
    print("__________________________________________________________________________________________________________________________ __________.json JSON Decoding e")
    print("__________________________________________________________________________________________________________________________ __________.json e")
    print("__________________________________________________________________________________________________________________________ __________.yaml s")
    import yaml  # pip install PyYAML
    with open('__________.yaml') as f:
        conf = yaml.load(f)
    __________1 = conf['language']
    __________2 = conf['pytest']
    print(__________1)
    print(__________2)
    print("__________________________________________________________________________________________________________________________ __________.yaml e")
    print("__________________________________________________________________________________________________________________________ doctest s")
    import doctest
    def ipconfig():
        """
            __________________________________________________________________________________________________________________________ description s
            author      : jung hoon park
            c:\> ipconfig
                    └>This function works like
            c:\> python _________.py
                        └>we can try like this
            c:\> python _________.py -v
                        └>we can try like this, if you want to more info.
            __________________________________________________________________________________________________________________________ description e
            >>> ipconfig()
            ???
        """
        return os.system('ipconfig')
    doctest.testmod()
    print("__________________________________________________________________________________________________________________________ doctest e")
    print("__________________________________________________________________________________________________________________________ pytest s")
    print("__________________________________________________________________________________________________________________________ pytest e")
    print("__________________________________________________________________________________________________________________________ data test s")
    print("데이터의 흐름 변화 그 안에서 마주하게된 정렬에 대한 필요성")
    data = __________1
    def checkData(__________):
        """
            __________________________________________________________________________________________________________________________ checkData(__________) doc s
            author      : jung hoon park
            c:\> ipconfig
                    └>This function works like this
            c:\> python _________.py
                        └>we can try like this
            c:\> python _________.py -v
                        └>we can try like this, if you want to more info.
            __________________________________________________________________________________________________________________________ checkData(__________) doc e
            >>> ipconfig()
            ???
        """
        if type(__________) == 'None':
            print(None)
        if type(__________) == 'String':
            print('String')
        if type(__________) == 'String':
            print('String')
        elif type(__________) == None:
            print(None)
    print("__________________________________________________________________________________________________________________________ data test e")
    print("__________________________________________________________________________________________________________________________ f 문자열 포매팅 s")
    # f-sting 은 파이썬 3.6 이후 기능
    number = 3
    print(f"number = {number}")
    print(f'number = {number}')
    #f - sting alignment
    print(f'{"test":_^22}') # '_______test_______'
    print(f'{"test":_<22}') # 'test______________'
    print(f'{"test":_>22}')  # '______________test'
    print(f'{{중괄호 사용법}}')  # {중괄호 사용법}
    print("__________________________________________________________________________________________________________________________ f 문자열 포매팅 e")
    print("__________________________________________________________________________________________________________________________ 데이터의 정렬 s")
    # 파이썬 3.6 버전부터는 자동으로 정렬을 해주므로 굳이 OrderedDict를 사용할 필요는 없다.
    from collections import OrderedDict
    od = OrderedDict()
    od['a'] = 'app'
    od['b'] = 'bow'
    od['c'] = 'cow'
    print(od)
    keys = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
    vals = ['app', 'bow', 'cow', 'doc', 'err', 'fly', 'gpu']
    od = OrderedDict((key, val) for key, val in zip(keys, vals))
    print(od)
    print("__________________________________________________________________________________________________________________________ 데이터의 정렬 e")

magical_words = {
    'as_str': 'as_str',
    'as_list': 'as_list',
    'and_do_nothing': 'and_do_nothing',
    'and_get_it': 'and_get_it',
    'and_print': 'and_print',
    'void': 'void',
    'return': 'return',
    'print': 'print',
    1: 1,
    2: 2,
    3: 3,
}


def chdir(path):
    os.chdir(path)


def dir():
    for i in os.listdir():
        # print(i, end = " ")
        print(i)


def mkdir(path):
    os.mkdir(path)


def mkdirtree(path):
    os.mkdirs(path)


def get_length_of_mp3(target_address):
    try:
        audio = MP3(target_address)
        # print(audio.info.length)
        return audio.info.length
    except:
        print('get_length_of_mp3 메소드에서 에러가 발생하였습니다')


def tasklist():
    for proc in psutil.process_iter():
        try:
            process_im_name = proc.name()
            processID = proc.pid
            print(process_im_name, ' - ', processID)

        except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):  # 예외처리
            pass


def taskkill(target_str):
    # target_str = 'Music.UI.exe'
    for proc in psutil.process_iter():
        try:
            process_im_name = proc.name()
            processID = proc.pid
            # print(process_im_name , '          - ', processID)

            if process_im_name.strip() == target_str:
                parent_pid = processID
                parent = psutil.Process(parent_pid)
                for child in parent.children(recursive=True):
                    child.kill()
                parent.kill()
                # print(target_str+' 와 자식 프로세스 죽이기를 시도했습니다')

        except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):  # 예외처리
            pass


def startRecordCommand(file_address):
    # sys.stdout = open('py cmd recording.txt', 'a', encoding='utf-8')  #
    # sys.stdout = open('py cmd recording.txt', 'w', encoding='utf-8')  #
    # sys.stdout = open('py cmd recording.txt', 'r', encoding='utf-8')  #
    sys.stdout = open(file_address, 'w', encoding='utf-8')  #


def endRecordCommand():
    sys.stdout.close()


def saveFileAs(fileAddress):
    startRecordCommand(fileAddress)
    print("이것은 param 두개가 더 필요해 보입니다.")
    endRecordCommand()


def readFile(fileAddress):
    with open(fileAddress, 'r', encoding='utf-8') as f:
        readed_text = f.read()
    return readed_text


def pause():
    os.system("pause")


def listen(recognizer, audio):
    pass


def to_time_style(time_style):
    now = time
    localtime = now.localtime()
    if time_style == '0':
        default = str(now.strftime('%Y_%m_%d_%H_%M_%S').replace('_', " "))
        return default
    elif time_style == '1':
        timestamp = str(now.time())
        return timestamp
    elif time_style == '2':
        yyyy_MM_dd_HH_mm_ss = str(now.strftime('%Y_%m_%d_%H_%M_%S'))
        return yyyy_MM_dd_HH_mm_ss
    elif time_style == '3':
        customTime1 = str(now.strftime('%Y-%m-%d %H:%M:%S'))
        return customTime1
    elif time_style == '4':
        office_style = str(now.strftime('%Y-%m-%d %H:%M'))
        return office_style
    elif time_style == '5':
        yyyy = str(localtime.tm_year)
        return yyyy
    elif time_style == '6':
        MM = str(localtime.tm_mon)
        return MM
    elif time_style == '7':
        dd = str(localtime.tm_mday)
        return dd
    elif time_style == '8':
        HH = str(localtime.tm_hour)
        return HH
    elif time_style == '9':
        mm = str(localtime.tm_min)
        return mm
    elif time_style == '10':
        ss = str(localtime.tm_sec)
        return ss
    elif time_style == '11':
        weekday = str(localtime.tm_wday)
        return weekday
    elif time_style == '12':
        elapsedDaysFromJan01 = str(localtime.tm_yday)
        return elapsedDaysFromJan01


def to_time_style_v2(time_style:str=None):
    now = time
    localtime = now.localtime()
    if time_style == None:
        default = str(now.strftime('%Y_%m_%d_%H_%M_%S').replace('_', " "))
        return default
    elif time_style.upper() == 'YYYY':
        yyyy = str(localtime.tm_year)
        return yyyy
    elif time_style == 'MM':
        MM = str(localtime.tm_mon)
        return MM
    elif time_style.upper() == 'DD':
        dd = str(localtime.tm_mday)
        return dd
    elif time_style.upper() == 'HH':
        HH = str(localtime.tm_hour)
        return HH
    elif time_style == 'mm':
        mm = str(localtime.tm_min)
        return mm
    elif time_style.upper() == 'SS':
        ss = str(localtime.tm_sec)
        return ss
    elif time_style.upper() == 'W':
        weekday = str(localtime.tm_wday)
        return weekday
    elif time_style.upper() == 'Y':
        elapsedDaysFromJan01 = str(localtime.tm_yday)
        return elapsedDaysFromJan01
    elif time_style == '1':
        timestamp = str(now.time())
        return timestamp
    elif time_style == '2':
        yyyy_MM_dd_HH_mm_ss = str(now.strftime('%Y_%m_%d_%H_%M_%S'))
        return yyyy_MM_dd_HH_mm_ss
    elif time_style == '3':
        customTime1 = str(now.strftime('%Y-%m-%d %H:%M:%S'))
        return customTime1
    elif time_style == '4':
        office_style = str(now.strftime('%Y-%m-%d %H:%M'))
        return office_style


def AI_Crawlweb(dataWebLocation, copied_html_selector):
    dataWebLocation = unquote(dataWebLocation)  # url decoding
    page = requests.get(dataWebLocation)
    soup = bs(page.text, "html.parser")

    # AI_print(page.text.split('\n'))#전체페이지를 본다

    elements = soup.select(copied_html_selector)
    for index, element in enumerate(elements, 1):
        # print("{} 번째 text: {}".format(index, element.text))
        continue

    return str(element.text)





def AI_respon(usr_input_txt):
    if usr_input_txt == 'pass':
        pass

    elif usr_input_txt == 'x':
        AI_speak('fake AI 를 종료합니다')
        exit()

    elif usr_input_txt == '미세먼지랭킹':
        # AI_speak('미세먼지랭킹 날씨 정보를 디스플레이 시도합니다')
        # AI_run('https://www.dustrank.com/air/air_dong_detail.php?addcode=41173103')
        # AI_speak('시도완료했습니다')
        # AI_speak('미세먼지랭킹 날씨 정보에 접근을 시도합니다')
        # AI_speak('미세먼지랭킹 정보 접근 시도')
        # AI_speak('미세먼지랭킹 정보')
        AI_run('https://www.dustrank.com/air/air_dong_detail.php?addcode=41173103')

    elif usr_input_txt == '종합날씨':
        AI_run('https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EA%B8%B0%EC%98%A8')

    elif usr_input_txt == 'taskkill(알송)':
        taskkill('ALSong.exe')
        taskkill('Alsong.exe')

    elif usr_input_txt == '시간':
        yyyy = to_time_style('5')
        MM = to_time_style('6')
        dd = to_time_style('7')
        HH = to_time_style('8')
        mm = to_time_style('9')
        ss = to_time_style('10')
        AI_speak('현재 시간은')
        AI_speak(yyyy + '년')
        AI_speak(MM + '월')
        AI_speak(dd + '일')
        AI_speak(HH + '시')
        AI_speak(mm + '분')
        AI_speak(ss + '초')
        AI_speak('입니다')
        pass

    elif usr_input_txt == '초미세먼지':
        # AI_speak('네이버 초미세먼지 정보 웹크롤링을 시도합니다.')
        dataWebLocation = "https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&qvt=0&query=%EC%A0%84%EA%B5%AD%EC%B4%88%EB%AF%B8%EC%84%B8%EB%A8%BC%EC%A7%80"
        copied_html_selector = '#main_pack > section.sc_new._atmospheric_environment > div > div.api_cs_wrap > div > div:nth-child(3) > div.main_box > div.detail_box'

        lines = "네이버 초미세먼지 정보\n" + AI_Crawlweb(dataWebLocation, copied_html_selector).replace("관측지점 현재 오전예보 오후예보", "",
                                                                                              1).replace("지역별 미세먼지 정보",
                                                                                                         "").strip().replace(
            "서울", "\n서울").replace("경기", "\n경기").replace("인천", "\n인천").replace("강원", "\n강원").replace("세종",
                                                                                                    "\n세종").replace(
            "충북", "\n충북").replace("충남", "\n충남").replace("전남", "\n전남").replace("전북", "\n전북").replace("광주",
                                                                                                    "\n광주").replace(
            "제주", "\n제주").replace("대전", "\n대전").replace("경북", "\n경북").replace("경남", "\n경남").replace("대구",
                                                                                                    "\n대구").replace(
            "울산", "\n울산").replace("부산", "\n부산").replace("     ", " ").replace("\n ", "\n").replace("  ", " ").replace(
            "  ", " ")
        # AI_speak('웹크롤링이 완료되었습니다')
        # AI_speak('서울과 경기도에 대한 초미세먼지 정보를 말씀드립니다')
        AI_speak('서울 경기도 초미세먼지 정보')

        # for line in range(0,len(lines.split('\n'))):
        # AI_speak(lines.split('\n')[line])

        # for line in range(0,len(lines.split(' '))):
        # AI_speak(lines.split(' ')[line].strip())

        for line in range(0, len(lines.split('\n'))):
            if '서울' in lines.split('\n')[line]:
                tmp = lines.split('\n')[line].split(' ')
                for i in range(0, len(tmp) - 3):
                    AI_speak(tmp[i])

            if '경기' in lines.split('\n')[line]:
                tmp = lines.split('\n')[line].split(' ')
                for i in range(0, len(tmp) - 3):
                    AI_speak(tmp[i])



    elif usr_input_txt == '공간':

        # 네이버 지역 정보 option s # 네이버 지역 정보 option s # 네이버 지역 정보 option s # 네이버 지역 정보 option s # 네이버 지역 정보 option s
        INFO_NAME = '네이버 지역 정보'
        dataWebLocation = 'https://weather.naver.com/'
        copied_html_selector = '#now > div > div.location_info_area > div.location_area > strong'
        # 네이버 지역 정보 option e # 네이버 지역 정보 option e # 네이버 지역 정보 option e # 네이버 지역 정보 option e # 네이버 지역 정보 option e

        # 구글 지역 정보 option s # 구글 지역 정보 option s # 구글 지역 정보 option s # 구글 지역 정보 option s # 구글 지역 정보 option s # 구글 지역 정보 option s
        # INFO_NAME='구글 지역 정보'
        # dataWebLocation = "https://www.google.com/search?q=%EA%B8%B0%EC%98%A8&oq=%EA%B8%B0%EC%98%A8&aqs=chrome..69i57j35i39j46i131i199i433i465i512j0i131i433i512l3j46i199i465i512j69i61.1706j1j7&sourceid=chrome&ie=UTF-8"
        # copied_html_selector = '#oFNiHe > div > div > div > div.eKPi4 > span.BBwThe'
        # 구글 지역 정보 option e # 구글 지역 정보 option e # 구글 지역 정보 option e # 구글 지역 정보 option e # 구글 지역 정보 option e # 구글 지역 정보 option e

        # AI_speak(INFO_NAME+nbsp+'웹크롤링을 시도합니다')
        # AI_speak('웹크롤링이 완료되었습니다')
        # AI_speak('현재위치에 대한 정보를 말씀드립니다')
        lines = AI_Crawlweb(dataWebLocation, copied_html_selector)
        # AI_print(lines)
        # print(lines)
        # AI_speak(INFO_NAME +'크롤링 결과를 말씀드립니다')
        AI_speak(INFO_NAME + '는')
        AI_speak(lines.strip())
        AI_speak('인 것으로 추측됩니다')


    elif usr_input_txt == '체감온도':  # [웹 스크랩핑 및 유효텍스트 파싱]

        # 네이버 지역 정보 option s # 네이버 지역 정보 option s # 네이버 지역 정보 option s # 네이버 지역 정보 option s # 네이버 지역 정보 option s
        INFO_NAME = '네이버 체감온도 정보'
        dataWebLocation = 'https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EA%B8%B0%EC%98%A8'
        copied_html_selector = '#main_pack > section.sc_new.cs_weather_new._cs_weather > div._tab_flicking > div.content_wrap > div.open > div:nth-child(1) > div > div.weather_info > div > div._today > div.temperature_info > dl > dd:nth-child(2)'
        # 네이버 지역 정보 option e # 네이버 지역 정보 option e # 네이버 지역 정보 option e # 네이버 지역 정보 option e # 네이버 지역 정보 option e

        # 구글 지역 정보 option s # 구글 지역 정보 option s # 구글 지역 정보 option s # 구글 지역 정보 option s # 구글 지역 정보 option s # 구글 지역 정보 option s
        # INFO_NAME='구글 체감온도 정보'
        # dataWebLocation = ''
        # copied_html_selector = ''
        # 구글 지역 정보 option e # 구글 지역 정보 option e # 구글 지역 정보 option e # 구글 지역 정보 option e # 구글 지역 정보 option e # 구글 지역 정보 option e

        dataWebLocation = unquote(dataWebLocation)  # url decoding
        page = requests.get(dataWebLocation)
        soup = bs(page.text, "html.parser")

        # AI_print(page.text.split('\n'))#전체페이지를 본다

        elements = soup.select(copied_html_selector)
        for index, element in enumerate(elements, 1):
            # print("{} 번째 text: {}".format(index, element.text))
            continue
        element_str = element.text
        print(element_str)

        AI_speak(INFO_NAME + '는')
        AI_speak(element_str.strip())
        AI_speak('인 것으로 추측됩니다')

    elif usr_input_txt == '미세먼지':
        try:
            print("__________________________________________________________________________________________________________________________ 미세먼지] ")
            INFO_NAME = '미세먼지랭킹 미세먼지 정보'
            dataWebLocation = 'https://www.dustrank.com/air/air_dong_detail.php?addcode=41173103'
            dataWebLocation = unquote(dataWebLocation)  # url decoding
            selenium_browser_mgr = webdriver.Chrome()
            # 이 주석은 '첫한글자_유실예방코드' 입니다>첫한글자_유실현상발견>원인분석실패>비온전대응
            selenium_browser_mgr.get(dataWebLocation)
            selenium_browser_mgr.implicitly_wait(5)
            selenium_browser_mgr.switch_to_frame('ifram id 를 수집해서 여기에 작성')

            time.sleep(random.uniform(3, 5))
            selenium_browser_mgr.find_element_by__xpath('').click()

            time.sleep(random.uniform(1, 2))
            print(selenium_browser_mgr.find_element_by__xpath('').text)

            # time.sleep(random.uniform(4, 5))
            selenium_browser_mgr.quit()

            # print(element_str)
            AI_speak('미세먼지')
            # AI_speak(element_str.strip())
        except Exception as e:
            print('______________________________________________________  trouble shooting info s')
            traceback.print_exc(file=sys.stdout)
            print(e)
            print('______________________________________________________  trouble shooting info e')
            AI_speak('익셉션이 발생하였습니다')


    elif usr_input_txt == '위드비전 근태관리':
        try:
            print("__________________________________________________________________________________________________________________________ 근태관리] ")
            INFO_NAME = '미세먼지랭킹 미세먼지 정보'
            web_path = 'https://www.dustrank.com/air/air_dong_detail.php?addcode=41173103'
            # web_path = unquote(web_path)  # url decoding
            selenium_browser_mgr = webdriver.Chrome()
            selenium_browser_mgr.implicitly_wait(5)
            selenium_browser_mgr.get(web_path)
            selenium_browser_mgr.switch_to_frame('ifram id 를 수집해서 여기에 작성')

            time.sleep(random.uniform(1, 2))
            selenium_browser_mgr.find_elements_by__css_selector('id').send_keys("pjh4139")
            selenium_browser_mgr.find_element_by_id_('pw').send_keys("비밀번호")

            time.sleep(random.uniform(3, 5))
            selenium_browser_mgr.find_element_by__xpath('').click()

            time.sleep(random.uniform(3, 5))
            selenium_browser_mgr.find_element_by__xpath('').click()

            time.sleep(random.uniform(1, 3))  # 자동화탐지를 우회 하기 위한 delay
            selenium_browser_mgr.find_element_by_id_('pw').submit()

            time.sleep(random.uniform(1, 3))  # 자동화탐지를 우회 하기 위한 delay
            # driver.find_element_by_id_("log.login").click()

            print('______________________________________________________  captcha alternative 1 s')
            # input_js = ' \
            #         document.getElement_by_id_("id").value = "{id}"; \
            #         document.getElement_by_id_("pw").value = "{pw}"; \
            #     '.format(id="test_id", pw="test_pw")
            # time.sleep(random.uniform(1, 3))  # 자동화탐지를 우회 하기 위한 delay
            # driver.execute_script(input_js)
            #
            # time.sleep(random.uniform(1, 3))  # 자동화탐지를 우회 하기 위한 delay
            # driver.find_element_by_id_("log.login").click()
            print('______________________________________________________  captcha alternative 1 e')

            time.sleep(random.uniform(1, 2))
            print(selenium_browser_mgr.find_element_by__xpath('').text)

            # 기존 scrollHeight를 저장
            last_height = selenium_browser_mgr.execute_script("return document.body.scrollHeight")
            while True:
                # Scroll down
                selenium_browser_mgr.execute_script("window.scrollTo(0, document.body.scrollHeight);")
                # page loading를 위한 대기 시간
                time.sleep(random.uniform(1.5, 2))  # Feed를 불러올 수 있도록 램덤 대기
                # 기존 height하고 변화가 발생하지 않을시 break
                new_height = selenium_browser_mgr.execute_script("return document.body.scrollHeight")
                if new_height == last_height:
                    break
                last_height = new_height

            # time.sleep(random.uniform(4, 5))
            selenium_browser_mgr.quit()

            # print(element_str)
            AI_speak('미세먼지')
            # AI_speak(element_str.strip())
        except Exception as e:
            print('______________________________________________________  trouble shooting info s')
            traceback.print_exc(file=sys.stdout)
            print('______________________________________________________  trouble shooting info e')
            AI_speak('익셉션이 발생하였습니다')

    elif usr_input_txt == '종합날씨정보':

        # 네이버 지역 정보 option s # 네이버 지역 정보 option s # 네이버 지역 정보 option s # 네이버 지역 정보 option s # 네이버 지역 정보 option s
        INFO_NAME = '네이버 종합날씨정보 정보'
        dataWebLocation = 'https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EA%B8%B0%EC%98%A8'
        # 네이버 지역 정보 option e # 네이버 지역 정보 option e # 네이버 지역 정보 option e # 네이버 지역 정보 option e # 네이버 지역 정보 option e

        dataWebLocation = unquote(dataWebLocation)  # url decoding
        page = requests.get(dataWebLocation)
        soup = bs(page.text, "html.parser")

        print("__________________________________________________________________________________________________________________________ 전체페이지 출력 시도] ")
        AI_print(page.text.split('\n'))

        print("__________________________________________________________________________________________________________________________ 기온] ")
        copied_html_selector = '#main_pack > section.sc_new.cs_weather_new._cs_weather > div._tab_flicking > div.content_wrap > div.open > div:nth-child(1) > div > div.weather_info > div > div._today > div.temperature_info > dl > dd:nth-child(2)'
        elements = soup.select(copied_html_selector)

        soup.prettify()

        print(str(soup))

        print(str(soup.prettify()))

        for index, element in enumerate(elements, 1):
            # print("{} 번째 text: {}".format(index, element.text))
            continue
        element_str = element.text.strip()
        print(element_str)
        AI_speak('기온')
        AI_speak(element_str.strip().replace('°', ''))
        AI_speak('도')
        print("__________________________________________________________________________________________________________________________ 현재온도] ")
        copied_html_selector = '#main_pack > section.sc_new.cs_weather_new._cs_weather > div._tab_flicking > div.content_wrap > div.open > div:nth-child(1) > div > div.weather_info > div > div._today > div.weather_graphic > div.temperature_text > strong'
        elements = soup.select(copied_html_selector)
        for index, element in enumerate(elements, 1):
            # print("{} 번째 text: {}".format(index, element.text))
            continue
        element_str = element.text.strip().replace('현재 온도', '')
        print(element_str)
        AI_speak('현재온도')
        AI_speak(element_str.replace('°', ''))
        AI_speak('도')
        print("__________________________________________________________________________________________________________________________ 체감온도] ")
        copied_html_selector = '#main_pack > section.sc_new.cs_weather_new._cs_weather > div._tab_flicking > div.content_wrap > div.open > div:nth-child(1) > div > div.weather_info > div > div._today > div.temperature_info > dl > dd:nth-child(2)'
        elements = soup.select(copied_html_selector)
        for index, element in enumerate(elements, 1):
            # print("{} 번째 text: {}".format(index, element.text))
            continue
        element_str = element.text.strip()
        print(element_str)
        AI_speak('체감온도')
        AI_speak(element_str.replace('°', ''))
        AI_speak('도')
        print("__________________________________________________________________________________________________________________________ 습도] ")
        copied_html_selector = '#main_pack > section.sc_new.cs_weather_new._cs_weather > div._tab_flicking > div.content_wrap > div.open > div:nth-child(1) > div > div.weather_info > div > div._today > div.temperature_info > dl > dd:nth-child(4)'
        elements = soup.select(copied_html_selector)
        for index, element in enumerate(elements, 1):
            # print("{} 번째 text: {}".format(index, element.text))
            continue
        element_str = element.text.strip()
        print(element_str)
        AI_speak('습도')
        AI_speak(element_str.replace('%', ''))
        AI_speak('퍼센트')
        print("__________________________________________________________________________________________________________________________ 바람] ")
        copied_html_selector = '#main_pack > section.sc_new.cs_weather_new._cs_weather > div._tab_flicking > div.content_wrap > div.open > div:nth-child(1) > div > div.weather_info > div > div._today > div.temperature_info > dl > dd:nth-child(6)'
        elements = soup.select(copied_html_selector)
        for index, element in enumerate(elements, 1):
            # print("{} 번째 text: {}".format(index, element.text))
            continue
        element_str = element.text
        print(element_str)
        AI_speak('바람')
        AI_speak(element_str.strip().replace('m/s', ''))
        AI_speak('미터퍼세크')
        print("__________________________________________________________________________________________________________________________ 자외선] ")
        copied_html_selector = '#main_pack > section.sc_new.cs_weather_new._cs_weather > div._tab_flicking > div.content_wrap > div.open > div:nth-child(1) > div > div.weather_info > div > div.report_card_wrap > ul > li.item_today.level2 > a > span'
        elements = soup.select(copied_html_selector)
        for index, element in enumerate(elements, 1):
            # print("{} 번째 text: {}".format(index, element.text))
            continue
        element_str = element.text
        print(element_str)
        AI_speak('자외선')
        AI_speak(element_str.strip())
        print("__________________________________________________________________________________________________________________________ 미세먼지] ")
        # 미세먼지랭킹 미세먼지 정보 s# 미세먼지랭킹 미세먼지 정보 s# 미세먼지랭킹 미세먼지 정보 s# 미세먼지랭킹 미세먼지 정보 s
        INFO_NAME = '미세먼지랭킹 미세먼지 정보'
        dataWebLocation = 'https://www.dustrank.com/air/air_dong_detail.php?addcode=41173103'
        # 미세먼지랭킹 미세먼지 정보 e # 미세먼지랭킹 미세먼지 정보 e # 미세먼지랭킹 미세먼지 정보 e # 미세먼지랭킹 미세먼지 정보 e
        dataWebLocation = unquote(dataWebLocation)  # url decoding
        page = requests.get(dataWebLocation)
        soup = bs(page.text, "html.parser")
        copied_html_selector = '#body_main > table:nth-child(7) > tbody > tr:nth-child(2) > td:nth-child(1) > div'
        elements = soup.select(copied_html_selector)
        for index, element in enumerate(elements, 1):
            # print("{} 번째 text: {}".format(index, element.text))
            continue
        element_str = element.text
        print(element_str)
        AI_speak('미세먼지')
        AI_speak(element_str.strip().replace('m/s', ''))
        print("__________________________________________________________________________________________________________________________ 초미세먼지] ")
        copied_html_selector = '#body_main > table:nth-child(7) > tbody > tr:nth-child(2) > td:nth-child(2) > div'
        elements = soup.select(copied_html_selector)
        for index, element in enumerate(elements, 1):
            # print("{} 번째 text: {}".format(index, element.text))
            continue
        element_str = element.text
        print(element_str)
        AI_speak('초미세먼지')
        AI_speak(element_str.strip())
        AI_speak('입니다')

        # print("__________________________________________________________________________________________________________________________ _________] ")
        # copied_html_selector = '_________'
        # elements = soup.select(copied_html_selector)
        # AI_print(elements)#추출된 elements 출력 시도

    elif usr_input_txt == 'hardcode json 처리':
        print("__________________________________________________________________________________________________________________________ json 처리 시작] ")
        INFO_NAME = '네이버 체감온도 정보'
        dataWebLocation = 'https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EA%B8%B0%EC%98%A8'
        copied_html_selector = '#main_pack > section.sc_new.cs_weather_new._cs_weather > div._tab_flicking > div.content_wrap > div.open > div:nth-child(1) > div > div.weather_info > div > div._today > div.temperature_info > dl > dd:nth-child(2)'

        dataWebLocation = unquote(dataWebLocation)  # url decoding
        page = requests.get(dataWebLocation)
        soup = bs(page.text, "html.parser")

        copied_html_selector = '_________'
        elements = soup.select(copied_html_selector)
        AI_speak(INFO_NAME + '는')
        AI_speak('인 것으로 추측됩니다')


    elif usr_input_txt == '네이버 미세먼지':
        AI_speak('네이버 미세먼지 정보 웹크롤링을 시도합니다.')
        dataWebLocation = "https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&qvt=0&query=%EC%A0%84%EA%B5%AD%EB%AF%B8%EC%84%B8%EB%A8%BC%EC%A7%80"
        copied_html_selector = '#main_pack > section.sc_new._atmospheric_environment > div > div.api_cs_wrap > div > div:nth-child(3) > div.main_box > div.detail_box'

        lines = "네이버 미세먼지정보\n" + AI_Crawlweb(dataWebLocation, copied_html_selector).replace("관측지점 현재 오전예보 오후예보", "",
                                                                                            1).replace("지역별 미세먼지 정보",
                                                                                                       "").strip().replace(
            "서울", "\n서울").replace("경기", "\n경기").replace("인천", "\n인천").replace("강원", "\n강원").replace("세종",
                                                                                                    "\n세종").replace(
            "충북", "\n충북").replace("충남", "\n충남").replace("전남", "\n전남").replace("전북", "\n전북").replace("광주",
                                                                                                    "\n광주").replace(
            "제주", "\n제주").replace("대전", "\n대전").replace("경북", "\n경북").replace("경남", "\n경남").replace("대구",
                                                                                                    "\n대구").replace(
            "울산", "\n울산").replace("부산", "\n부산").replace("     ", " ").replace("\n ", "\n").replace("  ", " ").replace(
            "  ", " ")
        # print(lines.replace("관측지점 현재 오전예보 오후예보","관측지점 현재 오전예보 오후예보\n"))
        # AI_speak('웹 크롤링된 네이버 미세먼지 정보 접근을 시도합니다.')
        # AI_speak('네이버 미세먼지 정보입니다')
        # AI_speak('다음은 네이버 미세먼지 정보입니다')
        # AI_speak('관측지점 현재 오전예보 오후예보')
        # AI_speak('웹 크롤링된 네이버 미세먼지 정보를 말씀드립니다')
        AI_speak('웹크롤링이 완료되었습니다')
        AI_speak('서울과 경기도에 대한 정보를 말씀드립니다')

        # for line in range(0,len(lines.split('\n'))):
        # AI_speak(lines.split('\n')[line])

        # for line in range(0,len(lines.split(' '))):
        # AI_speak(lines.split(' ')[line].strip())

        for line in range(0, len(lines.split('\n'))):
            if '서울' in lines.split('\n')[line]:
                tmp = lines.split('\n')[line].split(' ')
                for i in range(0, len(tmp) - 3):
                    AI_speak(tmp[i])

            if '경기' in lines.split('\n')[line]:
                tmp = lines.split('\n')[line].split(' ')
                for i in range(0, len(tmp) - 3):
                    AI_speak(tmp[i])

    elif usr_input_txt == '가용코드목록':
        AI_print(AI_available_cmd_code_list)
        AI_speak("조회되었습니다")

    # elif usr_input_txt == 'voiceless mode':
    # def AI_speak(text):
    # print(text)

    # elif usr_input_txt == 'voice mode':
    # def AI_speak(text):
    # address=os.getcwd()+'\\mp3\\'+ text +'.mp3'

    # if os.path.exists(address):
    # os.system('call "'+address+'"')
    # length_of_mp3 = get_length_of_mp3(address)
    # length_of_mp3 = float(length_of_mp3)
    # length_of_mp3 = round(length_of_mp3,1)
    # time.sleep(length_of_mp3*1.05)

    # else:
    # mgr_gTTS = gTTS(text=text, lang='ko')
    # mgr_gTTS.save('./mp3/'+ text +'.mp3')
    # os.system('call "'+address+'"')

    # length_of_mp3 = get_length_of_mp3(address)
    # length_of_mp3 = float(length_of_mp3)
    # length_of_mp3 = round(length_of_mp3,1)
    # time.sleep(length_of_mp3*1.05)

    # taskkill('ALSong.exe')

    # elif usr_input_txt == '`':
    #     AI_speak('single mode 가 시작되었습니다')
    #     # print('single mode s single mode s single mode s single mode s single mode s single mode s single mode s single mode s single mode s ')
    #     while(True):
    #         batch_mode_input=input('>>>')
    #         if batch_mode_input =='x':
    #             AI_speak('single mode를 종료합니다')
    #             break
    #         elif len(batch_mode_input)==1:
    #             usr_input_txt=AI_available_cmd_code_list[int(batch_mode_input)-1].split(':')[0]
    #             AI_respon(usr_input_txt)
    #         elif batch_mode_input =='':
    #             AI_speak('아무것도 입력되지 않았습니다')
    #         elif batch_mode_input =='`':
    #             AI_speak('백팁은 single mode에서 입력하실 수 없습니다.')
    #         else:
    #             AI_speak('single mode 에서는 1자리만 입력하실 수 있습니다.')
    #     # print('eingle mode e eingle mode e eingle mode e eingle mode e eingle mode e eingle mode e eingle mode e eingle mode e eingle mode e ')
    #

    # elif usr_input_txt == '``':
    #     AI_speak('batch mode 가 시작되었습니다')
    #     # print('batch mode s batch mode s batch mode s batch mode s batch mode s batch mode s batch mode s batch mode s batch mode s ')
    #     while(True):
    #         batch_mode_input=input('>>>')
    #         if batch_mode_input=='x' or batch_mode_input=='X' :
    #             AI_speak('batch mode를 종료합니다')
    #             break
    #         # batch_mode_input=list(batch_mode_input)                         # batch_mode_input = [3,2,1]
    #         # AI_speak('입력된 배치명령의 개수는' + str(len(batch_mode_input)+1) +'개 입니다')
    #         if batch_mode_input == '':
    #             AI_speak('아무것도 입력되지 않았습니다')
    #             AI_speak('명령코드를 입력해주세요')
    #         else:
    #             AI_speak('입력된 배치명령의 개수는' + str(len(batch_mode_input)) +'개 입니다')
    #             for i in range(0,len(batch_mode_input)):                      # i=0
    #                 usr_input_txt=AI_available_cmd_code_list[int(batch_mode_input[i])-1].split(':')[0] #usr_input_txt=AI_available_cmd_code_list[2].split(':')[0]
    #                 AI_speak(str(i+1)+'번째 코드를 실행시도합니다')
    #                 AI_respon(usr_input_txt)
    #
    #     # print('batch mode e batch mode e batch mode e batch mode e batch mode e batch mode e batch mode e batch mode e batch mode e ')

    elif usr_input_txt == '`':
        AI_speak('advanced batch mode 가 시작되었습니다')
        print(
            'advanced batch mode s advanced batch mode s advanced batch mode s advanced batch mode s advanced batch mode s advanced batch mode s advanced batch mode s')
        cls()
        print("")
        print("")
        print("")
        print("")
        # print(' '+'가용명령코드목록')
        print('                                     ' + '가용명령코드목록')
        print("")
        AI_print(AI_available_cmd_code_list)
        print("")
        while (True):
            batch_mode_input = input(
                "                                                                                                ")
            if batch_mode_input == 'x' or batch_mode_input == 'X':
                AI_speak('advanced batch mode를 종료합니다')
                break
            elif batch_mode_input == '':
                AI_speak('아무것도 입력되지 않았습니다')
                AI_speak('명령코드를 입력해주세요')
            else:
                list = batch_mode_input.split(' ')
                # AI_speak('입력된 코드 목록 입니다')
                # for str in list:
                #     AI_speak(str)
                # for i in range(0,len(list)-2):
                for list_element in list:
                    # AI_speak(str((i+1))+'번째 코드를 실행시도합니다')
                    # print(list[i])
                    # AI_respon(str(list[i]))
                    # if len(AI_available_cmd_code_list)<AI_available_cmd_code_list[int(list[i])-1].split(':')[0]:
                    # AI_respon(AI_available_cmd_code_list[int(list[i])-1].split(':')[0])
                    # print(list_element)
                    # for i in range(0, len(AI_available_cmd_code_list) - 1):
                    #     if usr_input_txt in AI_available_cmd_code_list[i].split(':')[0]:
                    #         # if usr_input_txt!='' or usr_input_txt!='`':
                    #         if usr_input_txt != '':
                    #             # AI_speak(AI_available_cmd_code_list[i].split(':')[0]+'에 대한 명령코드가 입력되었습니다')
                    #             pass
                    #
                    # AI_respon(usr_input_txt)
                    # try:
                    # print(len(AI_available_cmd_code_list[int(list_element) - 1]))
                    # print(AI_available_cmd_code_list[int(list_element) - 1])
                    # AI_speak(AI_available_cmd_code_list[int(list_element) - 1].split(':')[0])
                    try:
                        AI_respon(AI_available_cmd_code_list[int(list_element) - 1].split(':')[0])
                    except Exception as e:  # 모든 예외의 에러 메시지를 출력할 때는 Exception을 사용
                        AI_speak('advanced batch mode 실행 중 예외가 발생했습니다')
                        print('advanced batch mode 실행 중 예외가 발생했습니다')
                        print(e)
                        # AI_speak('가용코드 목록에 없는 코드입니다')

        print(
            'advanced batch mode e advanced batch mode e advanced batch mode e advanced batch mode e advanced batch mode e advanced batch mode e advanced batch mode e')


    elif usr_input_txt == '가용명령개수':
        AI_speak('가용명령의 개수는')
        AI_speak(str(len(AI_available_cmd_code_list)))
        AI_speak('개 입니다')
        AI_respon('3 ')

    elif usr_input_txt == '식물조언':
        AI_speak('식물에게 물샤워를 줄시간입니다')
        AI_speak('물샤워를 시켜주세요')
        AI_speak('오늘은 식물에게 햇빛샤워를 시켜주는날입니다')
        AI_speak('하늘이가 없을때 샤워를 시켜주세요')
        AI_speak('하트축전에게 빠르게 식물등빛을 주세요')
        AI_speak('이러다 죽습니다')
        AI_speak('서둘러 등빛을 주세요')

    elif usr_input_txt == '':
        AI_speak('아무것도 입력되지 않았습니다')
        AI_speak('명령코드를 입력해주세요')

    elif usr_input_txt == '몇 시야' or usr_input_txt == '몇시야':
        # AI_speak(to_time_style('5'))
        # AI_speak('년')
        # AI_speak(to_time_style('6'))
        # AI_speak('월')
        # AI_speak(to_time_style('7'))
        # AI_speak('일')
        AI_speak(to_time_style('8'))
        AI_speak('시')
        AI_speak(to_time_style('9'))
        AI_speak('분')
        AI_speak('입니다')

    elif usr_input_txt == 'jhppc1':
        jhppc1 = 'https://remotedesktop.google.com/access/session/b797cd99-b738-f4db-9b38-9a2e25a57a47'
        AI_run(jhppc1)

    elif usr_input_txt == 'remotedesktop':
        remotedesktop = 'https://remotedesktop.google.com/access'
        AI_run(remotedesktop)

    elif usr_input_txt == 'sd_s':
        ment = "정말로 컴퓨터를 종료할까요 원하시면 Y를 눌러주세요"
        AI_speak(ment)
        usr_input_txt = input(ment)
        if usr_input_txt.upper() == 'Y':
            ment = '시스템 종료를 시도합니다'

            # AI_speak('1시간 뒤 s')
            AI_speak(ment)
            # os.system('shutdown /s /t 3600')  # 1시간 뒤
            # AI_speak('1시간 뒤 e')

            # AI_speak('즉시 s')
            AI_speak(ment)
            os.system('shutdown /s /t 0')  # 즉시
            # AI_speak('즉시 e')

            # AI_speak('10분 뒤')
            AI_speak(ment)
            # os.system('shutdown /s /t 600') #10분 뒤
            # AI_speak('10분 뒤')
        else:
            pass

    elif usr_input_txt == 'sd_e':
        os.system('chcp 65001')
        # os.system('cmd /k shutdown -a')
        os.system('cmd /k shutdown -a > tmp.txt')
        os.system('echo 아래의 명령어를 사용하여 cmd를 종료하여 되돌아 갈 수 있습니다')
        os.system('echo exit()')

    elif usr_input_txt == 'cls()':
        cls()

    elif usr_input_txt == '스케쥴 모드':
        AI_speak('스케쥴 모드를 시작합니다')
        cnt = 0
        started_time = 0
        while (True):

            yyyy = to_time_style('5')
            MM = to_time_style('6')
            dd = to_time_style('7')
            HH = to_time_style('8')
            mm = to_time_style('9')
            ss = to_time_style('10')

            if cnt == 0:
                # AI_speak('while routine에 접근을 시도합니다')
                started_time = to_time_style('0')
                # AI_speak('컴퓨터와 대화할 준비가 되었습니다')
                # taskkill('ALSong.exe')
                cnt += 1
                cls()

            if ss == '30':
                # 5분마다 말하기 s
                # if int(mm)%'05'==0:
                # AI_speak('현재 시간은')
                # AI_speak(HH+'시')
                # AI_speak(mm+'분')
                # AI_speak('입니다')
                # 5분마다 말하기 e

                # 10분마다 말하기 s
                # if int(mm)%'10'==0:
                # AI_speak('현재 시간은')
                # AI_speak(HH+'시')
                # AI_speak(mm+'분')
                # AI_speak('입니다')
                # 10분마다 말하기 e

                # 9시에서 11시 사이에는 15분마다 말하기 s
                # if 9 <= int(HH) and int(HH) <= 23 and int(mm) % 15 == 0:
                if 9 <= int(HH) <= 23 and int(mm) % 15 == 0:  # 파이썬은 간결하게 이런것도 됩니다
                    AI_speak('현재 시간은')
                    AI_speak(HH + '시')
                    AI_speak(mm + '분')
                    AI_speak('입니다')
                # 9시에서 11시 사이에는 15분마다 말하기 e

                # 아침 6시 부터는 5분마다 시간 말하기 s
                if HH == '06' and int(mm) % 5 == 0:
                    AI_speak('현재 시간은')
                    AI_speak(HH + '시')
                    AI_speak(mm + '분')
                    AI_speak('입니다')
                # 아침 6시 부터는 5분마다 시간 말하기 e

                # 아침 7시 부터는 5분마다 시간 말하기 s
                if HH == '07' and int(mm) % 5 == 0:
                    AI_speak('현재 시간은')
                    AI_speak(HH + '시')
                    AI_speak(mm + '분')
                    AI_speak('입니다')
                # 아침 7시 부터는 5분마다 시간 말하기 e

                # 아침 8시에 시간 말하기 s
                if HH == '08' and mm == '00':
                    AI_speak('현재 시간은')
                    AI_speak(HH + '시')
                    AI_speak(mm + '분')
                    AI_speak('입니다')
                    AI_speak('더이상 나가는 것을 지체하기 어렵습니다')
                # 아침 8시에 시간 말하기 e

                # 아침 6시에 30분에 음악재생하기
                if HH == '06' and mm == '30':
                    AI_speak('음악을 재생합니다')
                    AI_run()
                    # [TO DO]

                if HH == '08' and mm == '50':
                    AI_speak('업무시작 10분전입니다')
                    AI_speak('업무준비를 시작하세요')
                    # [TO DO]

                if HH == '09' and mm == '00':
                    AI_speak('음악을 종료합니다')
                    # taskkill('Music.UI.exe')
                    # taskkill('ALSong.exe')
                    # time.sleep(10)
                    # [TO DO]

                if HH == '11' and mm == '30':
                    AI_speak('점심시간입니다')
                    # [TO DO]

                if HH == '11' and mm == '30':
                    AI_speak('음악을 재생합니다')
                    # [TO DO]

                if HH == '11' and mm == '30':
                    AI_speak('12시 30분 입니다')
                    AI_speak('씻으실 것을 추천드립니다')
                    AI_speak('샤워루틴을 수행하실 것을 추천드립니다')
                    # AI_speak('샤워루틴을 보조를 수행할까요')
                    # [TO DO]

                if HH == '11' and mm == '50':
                    AI_speak('12시 10분 전입니다')
                    AI_speak('누우실 것을 추천드립니다')
                    # AI_speak('주무실 것을 추천드립니다')
                    # [TO DO]

                # 30분 마다 랜덤기기(뽑기)를 의도한 수 나오면 프로그램 시작 경과시간 말하기
                if mm % 30 == 0:
                    go_or_no_go = random.randrange(1, 101)  # 1에서 100 사이의 수
                    if go_or_no_go == 55 or 58 or 100:
                        AI_speak('랜덤 수와 의도한 수가 일치합니다')

                        print('프로그램을 시작시간은')
                        print(started_time.split(' ')[0])  # 년
                        print('년')
                        print(started_time.split(' ')[1])  # 월
                        print('월')
                        print(started_time.split(' ')[2])  # 일
                        print('일')
                        print(started_time.split(' ')[3])  # 시
                        print('시')
                        print(started_time.split(' ')[4])  # 분
                        print('분')
                        print(started_time.split(' ')[5])  # 초

                        print('프로그램을 현재시각은')
                        print(yyyy)  # 년
                        print('년')
                        print(MM)  # 월
                        print('월')
                        print(dd)  # 일
                        print('일')
                        print(HH)
                        print('시')
                        print(mm)
                        print('분')

                        AI_speak('프로그램을 경과시각은')  # 경과일  ,   경과시각,   경과분,  모두 연산이 고민이 필요한 것 같다
                        delta_yyyy = str(float(yyyy) - float(started_time.split(' ')[0]))
                        AI_speak(delta_yyyy + '년')

                        delta_MM = str(float(MM) - float(started_time.split(' ')[1]))
                        AI_speak(delta_MM + '월')

                        delta_dd = str(float(dd) - float(started_time.split(' ')[2]))
                        AI_speak(delta_dd + '일')

                        delta_HH = str(float(HH) - float(started_time.split(' ')[3]))
                        AI_speak(delta_HH + '시')

                        delta_mm = str(float(mm) - float(started_time.split(' ')[4]))
                        AI_speak(delta_mm + '분')

                        AI_speak('프로그램을 시작한지')
                        AI_speak(delta_yyyy + '년')
                        AI_speak(delta_MM + '월')
                        AI_speak(delta_dd + '일')
                        AI_speak(delta_HH + '시')
                        AI_speak(delta_mm + '분')
                        AI_speak('으로 추측됩니다')

                        # [TO DO]


    elif usr_input_txt == '_________':
        AI_speak('해당 기능은 아직 준비되지 않은 서비스입니다.')

    else:
        # AI_speak('입력하신 내용이 usr_input_txt 는 oooo 과 유사합니다') #[to do]
        # AI_speak('해당 기능은 아직 준비되지 않은 서비스입니다.')
        available_no_cmd_list = []
        try:
            for i in range(0, len(AI_available_cmd_code_list)):
                available_no_cmd_list.append(i + 1)

            print(available_no_cmd_list)

            if int(usr_input_txt) in available_no_cmd_list:
                # AI_speak(str(available_no_cmd_list)+' 중에 하나라면 실행 가능한 코드입니다')
                # AI_speak(usr_input_txt+' 가용목록 인덱스가 입력되었습니다.')
                AI_speak('가용목록 인덱스가 입력되었습니다.')
                AI_speak('인덱스에 대한 코드를 수행합니다')

                # [TO_DO s]
                AI_speak(
                    '이 다음코드는 더이상 진행되지 않게. 루프의 처음부분으로 돌아가도록 리턴을 시키는 임시대응코드 입니다. 추후에 삭제를 하고. 엔덱스에 따라 작동하도록 다른 것으로 대체할 것 입니다')
                usr_input_txt = 'pass'
                # [TO_DO e]

            else:
                pass

        except Exception as e:
            print('______________________________________________________  trouble shooting info s')
            traceback.print_exc(file=sys.stdout)
            print('______________________________________________________  trouble shooting info e')
            AI_speak(
                '익셉션이 발생하였습니다. 익셉션을 발생시키고 넘어가도록 하는 것은. 익셉션을 발생시키지 않고 처리하는 것보다 좋은 방법은 아닌 것 같습니다. 추후에 수정을 해주세요. 일단은 진행합니다')
            # AI_speak('익셉션이 발생하였습니다')
            # AI_speak('익셉션을 발생시키고 넘어가도록 하는 것은 익셉션을 발생시키지 않고 처리하는 것보다 좋은 방법은 아닌 것 같습니다')
            # AI_speak('추후에 수정을 해주세요')
            # AI_speak('일단은 진행합니다')


def AI_speak(text):
    # address=r""+os.getcwd()+'\\mp3\\음성인식 준비되었습니다.mp3'
    # address=u""+os.getcwd()+'\\mp3\\음성인식 준비되었습니다.mp3'
    # address=os.getcwd()+'\\mp3\\음성인식 준비되었습니다.mp3'
    address = os.getcwd() + '\\mp3\\' + text + '.mp3'

    if os.path.exists(address):
        # print('파일이 있어 재생을 시도합니다')
        # os.system('"'+address+'"')#SUCCESS
        os.system('call "' + address + '"')  # SUCCESS[경로공백포함 시 인식처리]

        # mp3 파일의 재생 길이를 알아내서 그 시간만큼 sleep 시키는 코드를 추가[to do]
        length_of_mp3 = get_length_of_mp3(address)
        # print(length_of_mp3)
        length_of_mp3 = float(length_of_mp3)
        # print(length_of_mp3)
        length_of_mp3 = round(length_of_mp3, 1)
        # print(length_of_mp3)
        # time.sleep(length_of_mp3*0.95)
        # time.sleep(length_of_mp3*1.00)
        time.sleep(length_of_mp3 * 1.05)


    else:
        # print('가지고 있는 mp3 파일이 없어 생성을 시도합니다')
        mgr_gTTS = gTTS(text=text, lang='ko')
        mgr_gTTS.save('./mp3/' + text + '.mp3')
        os.system('call "' + address + '"')  # call을 사용해서 동기처리를 기대했으나 되지 않음.대안이 필요하다.

        # mp3 파일의 재생 길이를 알아내서 그 시간만큼 sleep 시키는 코드를 추가[to do]
        length_of_mp3 = get_length_of_mp3(address)
        # print(length_of_mp3)
        length_of_mp3 = float(length_of_mp3)
        # print(length_of_mp3)
        length_of_mp3 = round(length_of_mp3, 1)
        # print(length_of_mp3)
        # time.sleep(length_of_mp3*0.95)
        # time.sleep(length_of_mp3*1.00)
        time.sleep(length_of_mp3 * 1.05)

    taskkill('ALSong.exe')


def AI_listen():
    r = sr.Recognizer()
    m = sr.Microphone()
    # audio = sr.Microphone()
    # with sr.Microphone() as source:

    with m as source:
        # AI_speak('듣고 있습니다')
        print('듣고 있습니다')
        audio = r.listen(source)

    try:
        text = r.recognize_google(audio, language='ko-KR')  # 잘 못 알아먹는다.. 그러나 된다.
        # text=r.recognize_google_cloud(audio, language='ko-KR') # 인증 키가 없어서 안되나보다.
        # text=r.recognize_ibm(audio, language='ko')  # 인증 키가 없어서 안되나보다.
        # text=r.recognize_sphinx(audio, language='ko')  #안되는데
        # text=r.recognize_bing(audio, language='ko')    # 인증 키가 없어서 안되나보다.
        # text=r.recognize_sphinx(audio, language='ko')  #안되는데
        print(text)
    except sr.UnknownValueError:
        # AI_speak('언노운 익셉션이 발생하였습니다')
        print('언노운 익셉션이 발생하였습니다')
    except sr.RequestError as e:
        # AI_speak('리퀘스트 익셉션이 발생하였습니다')
        print('리퀘스트 익셉션이 발생하였습니다')
        # print('에러 코드 : {0}'.format(e))
        # print('에러 가능 원인 : API Key 에러, 네트워크 단절, 등')
    stop_listening = r.listen_in_background(m, listen)
    # print(audio)
    # print(listen)
    # print(r)
    # print(m)


def AI_run(target_str):
    last_txt = target_str.split('.')[-1]
    if 'http' in target_str:
        if '%' in target_str:
            target_str = 'explorer "' + unquote(target_str).strip() + '"'  # url decoding
            os.system(target_str)
        else:
            os.system('start ' + target_str)
            # os.system('explorer ' + target_str)
            # __________________________________________________________________________________________________________________________ 방법1 s
            chromeMgr = webdriver.Chrome()
            # 이 주석은 '첫한글자_유실예방코드' 입니다>첫한글자_유실현상발견>원인분석실패>비온전대응
            chromeMgr.get(target_str)
            # __________________________________________________________________________________________________________________________ 방법1 e

    elif 'txt' in last_txt:
        os.system('start ' + target_str)
        # os.startfile(os.getcwd()+'/mp3/'+ text +'.mp3') #비동기처리방식
        # os.system('call "'+os.getcwd()+'/mp3/'+ text +'.mp3"')  #동기처리방식[실패]

    elif 'mp3' in last_txt:
        os.system('start ' + target_str)

    elif 'mp4' in last_txt:
        os.system('start ' + target_str)
        # [TO DO]


def AI_print(target_list):
    cnt = 1
    for target in target_list:
        # print('+str(cnt)+nbsp+':'+nbsp+target)
        # print('         '+str(cnt)+nbsp+':'+nbsp+target)
        print('                                             ' + str(cnt) + nbsp + ':' + nbsp + target)
        # print("")
        cnt += 1


def convert_path_style(path_str, style_no):
    # if style_no == "1":
        # if "\\" in path_str:
            # path_str = path_str.replace("\\", "/")
            # return path_str

    # elif style_no == "2":
        # if "/" in path_str:
            # path_str = path_str.replace("/", "\\")
            # return path_str

    # elif style_no == "3":
        # if "\\\\" in path_str:
            # path_str = path_str.replace("\\\\", "\\")
            # return path_str

    # elif style_no == "4":
        # if "//" in path_str:
            # path_str = path_str.replace("//", "/")
            # return path_str

    # elif style_no == "5":
        # if "/" in path_str:
            # path_str = path_str.replace("/", "//")
            # return path_str

    # elif style_no == "6":
        # if "\\" in path_str:
            # path_str = path_str.replace("\\", "\\\\")
            # return path_str

    if style_no=="/":
        if "\\" in path_str:
            path_str = path_str.replace("\\", "/")
            return path_str
        if "//" in path_str:
            path_str = path_str.replace("//", "/")
            return path_str

    elif style_no=="\\":
        if "/" in path_str:
            path_str = path_str.replace("/", "\\")
            return path_str
        if "\\\\" in path_str:
            path_str = path_str.replace("\\\\", "\\")
            return path_str

    elif style_no=="//":
        if "/" in path_str:
            path_str = path_str.replace("/", "//")
            return path_str

    elif style_no=="\\\\":
        if "\\" in path_str:
            path_str = path_str.replace("\\", "\\\\")
            return path_str


    else:
        AI_speak('trouble shooting info id')
        AI_speak('yyyy MM dd HH mm ss')


def get_length_by__using_(______tuple):  # done
    return len(______tuple)


def get_keys_by__using_(______tuple, _____as):
    if _____as == 'as_str':
        return str(______tuple.keys()).replace("dict_keys([", "").replace("])", "").replace("\'", "")
    elif _____as == 'as_list':
        return get_keys_by__using_(______tuple, "as_str").split(", ")
    else:
        print("it is not magical word. so do nothing")

def print_key_with_index_by__using_(______tuple):
    for ______tuple_key in get_keys_by__using_(______tuple, "as_list"):
        print(str(get_keys_by__using_(______tuple, "as_list").index(______tuple_key)) + " " + ______tuple_key)


def get_values_by__using_(______tuple, _____as):
    if _____as == magical_words['as_str']:
        index_cnt = 0
        tmp_str = ""
        for key, value in ______tuple.items():
            if tmp_str != "":
                tmp_str = tmp_str + "\n"
            tmp_str = tmp_str + str(value)
            index_cnt + +1
        return tmp_str
    if _____as == magical_words['as_list']:
        index_cnt = 0
        tmp_list = []
        for key, value in ______tuple.items():
            tmp_list.append(str(value))
            index_cnt + +1
        return tmp_list

def print_index_and_value_and_key_by__using_(______tuple, mode):
    if mode == magical_words[1]:
        index_cnt = 0
        tmp_str = ""
        for key, value in ______tuple.items():
            tmp_str = str(index_cnt) + "\t" + str(key)
            print(tmp_str)
            index_cnt = index_cnt + 1
    elif mode == magical_words[2]:
        index_cnt = 0
        tmp_str = ""
        for key, value in ______tuple.items():
            tmp_str = str(index_cnt) + "\t" + str(value)
            print(tmp_str)
            index_cnt = index_cnt + 1
    elif mode == magical_words[3]:
        index_cnt = 0
        tmp_str = ""
        for key, value in ______tuple.items():
            tmp_str = str(index_cnt) + "\t" + str(key) + "\t" + str(value)
            print(tmp_str)
            index_cnt = index_cnt + 1
    else:
        print("it is not magical word. so do nothing")

def getText_by__using_(_____list, _____mode):
    if _____mode == magical_words["as_tuple"]:
        print("__________________________________________________________________________________________________________________________ TBD")

def replace_text_B_and_text_C_interchangeably_at_text_A_by__using_(____text_A, ____text_B, ____text_C, _____and):
    tmp_foo = "{{kono foo wa sekai de uituna mono ni motomo chikai desu}}"
    text_special = "{{no}}"
    text_B_cnt = ____text_A.count(____text_B)
    tmp_list = []
    tmp_str = ""
    tmp_cmt = 0
    if ____text_C == "":
        ____text_A = ____text_A.replace(____text_B, ____text_C)
    elif text_special in ____text_C:
        print("text_A 에서 " + ____text_B + " 를 총" + str(text_B_cnt) + "개 발견하였습니다")
        tmp_list = ____text_A.split(____text_B)
        if ____text_B in ____text_C:
            tmp_cmt = 0
            for j in tmp_list:
                if j == tmp_list[-1]:
                    pass
                else:
                    tmp_str = tmp_str + j + ____text_C.split(text_special)[0] + str(tmp_cmt)
                tmp_cmt = tmp_cmt + 1
            ____text_A = ""
            ____text_A = tmp_str
        else:
            tmp_cmt = 0
            for j in tmp_list:
                if j == tmp_list[-1]:
                    pass
                else:
                    tmp_str = tmp_str + j + ____text_C.split(text_special)[0] + str(tmp_cmt)
                tmp_cmt = tmp_cmt + 1
            ____text_A = ""
            ____text_A = tmp_str
    else:
        ____text_A = ____text_A.replace(____text_C, tmp_foo)
        ____text_A = ____text_A.replace(____text_B, ____text_C)
        ____text_A = ____text_A.replace(tmp_foo, ____text_B)
    if _____and == magical_words["and_do_nothing"]:  # void mode
        pass
    elif _____and == magical_words["and_get_it"]:  # return mode
        return ____text_A
    elif _____and == magical_words["and_print"]:  # print mode
        print(____text_A)
    else:
        print("it is not magical word. so do nothing")

def act_via_interchangeable_triangle_model_by__using_(____text_A, ____text_B, ____text_C, _____and):
    tmp_foo = "{{kono foo wa sekai de uituna mono ni motomo chikai desu}}"
    if ____text_C == "":
        ____text_A = ____text_A.replace(____text_B, ____text_C)
    else:
        ____text_A = ____text_A.replace(____text_C, tmp_foo)
        ____text_A = ____text_A.replace(____text_B, ____text_C)
        ____text_A = ____text_A.replace(tmp_foo, ____text_B)
    if _____and == magical_words["and_do_nothing"]:  # void mode
        pass
    elif _____and == magical_words["and_get_it"]:  # return mode
        return ____text_A
    elif _____and == magical_words["and_print"]:  # print mode
        print(____text_A)
    else:
        print("it is not magical word. so do nothing")

def pause():
    try:
        print("__________________________________________________________________________________________________________________________ code debugging")
        os.system("chcp 65001")
        os.system("pause")
    except Exception as e:
        print('______________________________________________________ troubleshooting s')
        traceback.print_exc(file=sys.stdout)
        print('______________________________________________________ troubleshooting e')

def is_in_(str, line):
    if str in line:
        return True

def mkr_s():
    print("__________________________________________________________________________________________________________________________ mkr s")

def mkr_e():
    print("__________________________________________________________________________________________________________________________ mkr e")

def push_to_remote_repository():
    print('__________________________________________________________ auto git add.log ' + to_time_style('0') + ' s')
    cmd_result = subprocess.check_output('git add * ', shell=True).decode('utf-8')  # cmd 결과 를 python 에서 값읽기
    if "" in cmd_result:
        # print('auto git add success')
        os.system('color 0a')
    else:
        print('auto git add fail')
        os.system('color 04')
    print('__________________________________________________________ auto git add.log ' + to_time_style('0') + ' e')
    # commit_ment = to_time_style('0')
    # commit_ment = "auto pushed"
    # commit_ment = "auto pushed at " + to_time_style('0')
    # commit_ment = "테스트 커밋"
    # commit_ment = "프로젝트 이니셜 커밋"
    commit_ment = "플러터 안드로이드 앱 업데이트 PHASE 1"
    # commit_ment = "당근마껫 UI 업데이트"#월
    # commit_ment = "당근마껫 페이지 추가제작"#화
    # commit_ment = "당근마껫 페이지 추가제작"#수
    # commit_ment = "당근마껫 UI 업데이트"  # 월
    # commit_ment = "당근마껫 페이지 추가제작"  # 화
    # commit_ment = "당근마껫 페이지 추가제작"  # 수


    cmd_result = subprocess.check_output('git commit -m "' + commit_ment + '"',
                                         shell=True).decode('utf-8')
    print(
        '__________________________________________________________ auto git commit.log ' + to_time_style('0') + ' s')
    cmd_result = subprocess.check_output('git status | findstr "nothing to commit, working tree clean"',
                                         shell=True).decode('utf-8')
    if "nothing to commit, working tree clean" in cmd_result:
        # print('auto git commit success')
        os.system('color 0a')
    else:
        print('auto git commit fail')
        os.system('color 04')
    print(
        '__________________________________________________________ auto git commit.log ' + to_time_style('0') + ' e')
    print('__________________________________________________________ auto git push.log ' + to_time_style('0') + ' s')
    cmd_result2 = subprocess.check_output('git push -u origin main', shell=True).decode('utf-8')
    if "Everything up-to-date" or "branch 'main' set up to track 'origin/main'." in cmd_result2:
        # print('auto git push success')# DEVELOPMENT
        os.system('color 0a')# OPERATION

        # print(to_time_style_v2())# DEVELOPMENT
        # print(to_time_style_v2('HH'))# DEVELOPMENT
        if int('08')<=int(to_time_style_v2('HH'))<=int('23'):  # 하도 자는데 시끄러워서 추가한 코드
            os.system('call py ".\.orichalcum\my_gtts.py" "깃허브에 프로젝트 푸쉬를 완료했습니다"')
    else:
        print('auto git push fail')
        os.system('color 04')
    print('__________________________________________________________ auto git push.log ' + to_time_style('0') + ' e')



print("__________________________________________________________________________________________________________________________ opening log s")
time_s = time.time()
print(to_time_style('0'))
print("__________________________________________________________________________________________________________________________ opening log e")

print("__________________________________________________________________________________________________________________________ s")
import random
while True:
    push_to_remote_repository()
    # tmp = random.randint(0, 5) # FOR 확신하고 빠르게 GIT PUSH
    tmp = random.randint(400, 600) # FOR GIT HUB CONTRIBUTION COUNT INCREASEMENT
    print("RPA works again in "+str(tmp)+" seconds...")
    os.system("echo .>> foo.txt")
    time.sleep(tmp)


# color_codes=[
#     '0',
#     '1',
#     '2',
#     '3',
#     '4',
#     '5',
#     '6',
#     '7',
#     '8',
#     '9',
#     'a',
#     'b',
#     'c',
#     'd',
#     'e',
#     'f',
# ]
# for color_code in color_codes:
#     print('color 0' + color_code) # DEVELOPMENT
#     os.system('color 0'+color_code)
#     time.sleep(2)


print("__________________________________________________________________________________________________________________________ e")
print("__________________________________________________________________________________________________________________________ ending log s")
time_e = time.time()
print(to_time_style('0'))
print(time_e - time_s)
print("__________________________________________________________________________________________________________________________ ending log e")